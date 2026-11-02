#!/usr/bin/env python3
"""Verify and import the cask from meep's latest stable release."""

import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
REPO = "cross-entropy-ai/meep"
VERSION_PATTERN = r"(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)"


def sync(destination: Path) -> None:
    result = subprocess.run(
        ["gh", "release", "view", "--repo", REPO, "--json", "tagName,isDraft,isPrerelease"],
        check=True, capture_output=True, text=True,
    )
    release = json.loads(result.stdout)
    tag = release["tagName"]
    if release["isDraft"] or release["isPrerelease"] or not re.fullmatch("v" + VERSION_PATTERN, tag):
        raise ValueError("Expected a published stable release")
    version = tag[1:]
    if destination.exists():
        current = re.search(r'^  version "(' + VERSION_PATTERN + ')"$', destination.read_text(), re.MULTILINE)
        if not current:
            raise ValueError("Cannot determine current cask version")
        if tuple(map(int, current[1].split("."))) > tuple(map(int, version.split("."))):
            print(f"Ignoring older release {tag}")
            return

    with tempfile.TemporaryDirectory() as directory:
        subprocess.run(
            ["gh", "release", "download", tag, "--repo", REPO,
             "--pattern", "meep.rb", "--pattern", "checksums.txt", "--dir", directory],
            check=True,
        )
        downloaded = Path(directory)
        cask = (downloaded / "meep.rb").read_bytes()
        manifest = (downloaded / "checksums.txt").read_text().splitlines()
        entries = [line.split() for line in manifest if line.split()[-1:] == ["meep.rb"]]
        if len(entries) != 1 or len(entries[0]) != 2 or entries[0][0] != hashlib.sha256(cask).hexdigest():
            raise ValueError("Homebrew cask checksum mismatch")
        text = cask.decode()
        if 'cask "meep" do' not in text.splitlines() or f'  version "{version}"' not in text.splitlines():
            raise ValueError("Cask does not match release")
        if destination.exists() and destination.read_bytes() == cask:
            print(f"meep is already at {tag}")
            return
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(cask)
        print(f"Updated meep to {tag}")


if __name__ == "__main__":
    sync(ROOT / "Casks" / "meep.rb")
