#!/usr/bin/python

import subprocess
import sys
import time

printed = False


def run_command(cmd):
    process = subprocess.run(
        cmd,
        stdout=subprocess.PIPE,
        universal_newlines=True
    )

    return process.stdout

def get_string():
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
                return (f"Nothing playing", "normal")
                break
            if title == "Netflix":
                return (f"Netflix", "netflix")
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

                return (f" {artist} - {title}", "spotify")
                break

            elif player.startswith("chromium"):
                return (f"  {title}", "youtube")
                break
    return (f"Nothing Playing", "normal")

(name, cls) = get_string()
print(f'{{"text":"{name}", "class":"{cls}"}}')
