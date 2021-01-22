import sys
from pathlib import Path
import requests
from bs4 import BeautifulSoup

if len(sys.argv) < 2:
    print("Url required")
    sys.exit(1)

url = sys.argv[1]

r = requests.get(url)

if r.status_code != 200:
    print("Website doesn't exist")
    sys.exit(1)

print("Url Exists")
print("Parsing Html")

soup = BeautifulSoup(r.text, 'html.parser')

name = soup.title.string

file_contents = f"""
[Desktop Entry]
Type=Application
Name={name}
Comment={name}
Exec=env MOZ_ENABLE_WAYLAND=1 /usr/lib/firefox/firefox --ssb {url}
Terminal=false
"""

file_path = f"{Path.home()}/.local/share/applications/{name}.desktop"
print(f"Creating desktop entry at {file_path}")

f = open(file_path, 'w')

f.write(file_contents)
f.close()

print("Application Added!")
