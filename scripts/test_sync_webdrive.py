import hashlib
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import sync_webdrive


class SyncTests(unittest.TestCase):
    def fake_gh(self, command, **kwargs):
        if command[2] == "view":
            return subprocess.CompletedProcess(command, 0, json.dumps({"tagName": "v0.1.4", "isDraft": False, "isPrerelease": False}))
        destination = Path(command[command.index("--dir") + 1])
        formula = b'class Webdrive < Formula\n  version "0.1.4"\nend\n'
        (destination / "webdrive.rb").write_bytes(formula)
        digest = "0" * 64 if self.corrupt else hashlib.sha256(formula).hexdigest()
        (destination / "checksums.txt").write_text(f"{digest}  webdrive.rb\n")
        return subprocess.CompletedProcess(command, 0)

    def setUp(self):
        self.corrupt = False

    def test_imports_verified_formula_and_is_idempotent(self):
        with tempfile.TemporaryDirectory() as directory, patch("sync_webdrive.subprocess.run", side_effect=self.fake_gh):
            destination = Path(directory) / "Formula/webdrive.rb"
            sync_webdrive.sync(destination)
            self.assertIn('version "0.1.4"', destination.read_text())
            modified = destination.stat().st_mtime_ns
            sync_webdrive.sync(destination)
            self.assertEqual(destination.stat().st_mtime_ns, modified)

    def test_corrupt_formula_does_not_replace_current_formula(self):
        self.corrupt = True
        with tempfile.TemporaryDirectory() as directory, patch("sync_webdrive.subprocess.run", side_effect=self.fake_gh):
            destination = Path(directory) / "webdrive.rb"
            previous = 'class Webdrive < Formula\n  version "0.1.3"\nend\n'
            destination.write_text(previous)
            with self.assertRaisesRegex(ValueError, "checksum"):
                sync_webdrive.sync(destination)
            self.assertEqual(destination.read_text(), previous)

    def test_prevents_version_rollback(self):
        with tempfile.TemporaryDirectory() as directory, patch("sync_webdrive.subprocess.run", side_effect=self.fake_gh) as run:
            destination = Path(directory) / "webdrive.rb"
            previous = 'class Webdrive < Formula\n  version "0.2.0"\nend\n'
            destination.write_text(previous)
            sync_webdrive.sync(destination)
            self.assertEqual(destination.read_text(), previous)
            self.assertEqual(run.call_count, 1)


if __name__ == "__main__":
    unittest.main()
