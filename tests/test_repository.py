from pathlib import Path
from tempfile import TemporaryDirectory
import unittest

from scripts.install import install
from scripts.validate_repository import ROOT, validate, validate_benchmark_manifest, validate_site_contract


class RepositoryValidationTest(unittest.TestCase):
    def test_repository_is_valid(self) -> None:
        self.assertEqual(validate(ROOT), [])

    def test_complete_benchmark_requires_evidence(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            manifest = root / "manifest.json"
            manifest.write_text(
                '{"arm":"baseline","status":"complete","artifacts":[]}',
                encoding="utf-8",
            )
            errors = validate_benchmark_manifest(manifest, root)
            self.assertTrue(any("missing model" in error for error in errors))
            self.assertTrue(any("requires evidence" in error for error in errors))

    def test_site_contract_is_valid(self) -> None:
        self.assertEqual(validate_site_contract(ROOT), [])


class InstallerTest(unittest.TestCase):
    def test_installs_selected_skill(self) -> None:
        with TemporaryDirectory() as temporary:
            destination = Path(temporary)
            installed = install(destination, ["flutter-design"])
            self.assertEqual(installed, [destination / "flutter-design"])
            self.assertTrue((installed[0] / "SKILL.md").exists())
            self.assertTrue((installed[0] / "references" / "visual-direction.md").exists())

    def test_refuses_overwrite_without_force(self) -> None:
        with TemporaryDirectory() as temporary:
            destination = Path(temporary)
            install(destination, ["flutter-design"])
            with self.assertRaises(FileExistsError):
                install(destination, ["flutter-design"])

    def test_rejects_unknown_skill(self) -> None:
        with TemporaryDirectory() as temporary:
            with self.assertRaises(ValueError):
                install(Path(temporary), ["unknown-skill"])


if __name__ == "__main__":
    unittest.main()
