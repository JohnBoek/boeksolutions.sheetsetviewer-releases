# BoekSolutions SheetSet Viewer

A Windows desktop tool for viewing AutoCAD Sheet Set (`.dst`) data — read-only, no AutoCAD installation required.

## ⬇️ Download

Grab the latest installer from **[Releases](../../releases/latest)**. Run the `.exe` and follow the wizard. Installation requires administrator rights and installs for all Windows users in `Program Files\BoekSolutions\SheetSetViewer`.

When upgrading a per-user installation from 1.1.1 or earlier, close the Viewer and uninstall that copy in Windows Settings while signed in as that user, then run the new installer. Your settings, license and trial state are retained.

## What it does

- **Browse sheet sets without AutoCAD.** View sheets, subsets, and custom properties from any `.dst`/`.xml` sheet set file.
- **PDF lookup.** Automatically finds and lists matching PDFs for sheets in the set.
- **DWG/folder shortcuts.** Jump straight to a sheet's DWG file or containing folder.
- **Three themes**: Light, Dark, and "Book" (a warm parchment-and-gold look).
- **Automatic update checks**, so you're always notified when a new version is available.

## Requirements

- Windows 10/11, x64

## Updates

The app checks for new versions on startup and prompts you when one's available — no manual downloading required after your first install.

## Security

Every installer here is a tested Release build, manually verified before publishing. Note: installers are not yet code-signed, so Windows SmartScreen may warn on first run — click "More info" → "Run anyway" if so. If a Release asset in this repository ever looks tampered with or doesn't match what you'd expect from an official BoekSolutions release, **do not run it** — open an issue here instead.
