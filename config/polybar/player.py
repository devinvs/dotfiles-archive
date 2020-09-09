import subprocess
import sys
import time

printed = False


def run_command(cmd):
    process = subprocess.run(cmd,
                             stdout=subprocess.PIPE,
                             universal_newlines=True)

    return process.stdout


def sprint(*str):
    global printed
    printed = True
    print(*str, file=sys.stdout)
    sys.stdout.flush()


def print_player():
    padding = " " * 8
    players = run_command(["playerctl", "-al"]).split("\n")
    player_status = run_command(["playerctl", "-a", "status"]).split("\n")

    for (player, status) in zip(players, player_status):
        if player.strip() == "":
            continue

        if status == "Playing":
            title = run_command([
                "playerctl",
                "-p",
                player,
                "metadata",
                "-f",
                "{{title}}"]
            ).strip()

            if title is None or title.strip() == "":
                sprint(f"{padding} Nothing playing {padding}")
                break
            if title == "Netflix":
                sprint(f"%{{B#F3636C}} {padding} Netflix {padding} %{{B-}}")
                break
            elif player.startswith("spotify"):
                artist = run_command([
                    "playerctl",
                    "-p",
                    player,
                    "metadata",
                    "-f",
                    "{{artist}}"
                    ]).strip()
                if artist.strip() == "":
                    artist = run_command([
                        "playerctl",
                        "-p",
                        player,
                        "metadata",
                        "-f",
                        "{{album}}"
                        ]).strip()

                sprint(f"%{{B#5FC883}} {padding}  {artist} - {title} {padding} %{{B-}}")
                break

            elif player.startswith("chromium"):
                sprint(f"%{{B#F3636C}} {padding}   {title} {padding} %{{B-}}")
                break
    if not printed:
        sprint(f"{padding} Nothing Playing {padding}")


while True:
    printed = False
    print_player()
    time.sleep(3)
