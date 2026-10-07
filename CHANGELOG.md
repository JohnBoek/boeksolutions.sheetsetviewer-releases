# Changelog

## v1.1.2 (2026-10-07)

- Improved: installs for all Windows users in Program Files with administrator rights and shared shortcuts. Existing per-user installations receive clear migration guidance; settings and licenses are retained.
- Improved: the optional desktop shortcut is selected by default for new installations.
- Fixed: translations across all ten languages, including consistent sheet set and file terminology, spelling and clearer error messages.
- Fixed: property headings and license information follow the selected language immediately; license expiry dates use that language's date format.
- Fixed: unlicensed, expired trial and invalid license states now have distinct, accurate labels.
- Improved: new installations default to English while existing language choices are retained.
- Improved: native error messages follow the application language and theme, with localized support-email subjects.
- Improved: adopted the updated BoekSolutions GitHub issue, pull request and release templates.

## v1.1.1 (2026-09-15)

- Improved: options now have one clear place under Tools, and the license indicator opens license details directly.
- Added: a visible, selectable Machine ID with a copy button in Options, including for already activated licenses.
- Improved: open DWG and PDF files by clicking their filenames, with a folder button beside each file.
- Added: preferences for the properties panel, grid lines, and expanding the sheet set tree when opening a project.
- Improved: resizable settings and license windows, clearer tabs and guidance, and easier pasting of long license keys.
- Fixed: relative drawing and PDF locations now resolve from the original sheet set folder.
- Fixed: failed update checks no longer report that the app is up to date; file-opening and clipboard failures show clearer feedback.

## v1.1.0 (2026-09-15)

- Added: one-time licenses for one active computer, with no annual renewal or restriction to a specific AutoCAD version.
- Improved: activate and move a license through the personal link in your purchase email. A valid permanent license also works offline.
- Improved: existing registered licenses are converted automatically while keeping their original expiry date. Connect to the internet for the first start after this update; after conversion, a valid permanent license works offline.
- Security: license signatures are now checked without storing a license-creation secret in the app.

## v1.0.4 (2026-07-23)

- Improved: in the license window, "Buy license" is now the primary button. Reporting an
  activation or purchase problem is now a smaller link instead of its own button.
- Improved: the sheet set tree now starts collapsed instead of fully expanded, so large sheet
  sets are easier to navigate at a glance.

## v1.0.3 (2026-07-08)

- Fixed: opening a file from a second window (e.g. double-clicking a .dst while the Viewer was
  already open) could hang the second launch if there was a problem opening it, instead of showing
  an error and closing normally.
- Fixed: a license check that failed unexpectedly at startup could permanently block opening files
  until the app was restarted, instead of retrying next time.
- Improved: the sheet properties panel now loads and scrolls smoothly even for sheet sets with
  hundreds of custom property values.
- Fixed (rare): launching the app with an empty file argument could leave a hidden background
  process running.
- Fixed: opening a file via a relative path could, in a rare case, cause "Reload" to look in the
  wrong location later if the app's working directory had changed since.

## v1.0.2 (2026-07-07)

- Fixed: closing the update dialog without clicking a button (the X button, Alt+F4, Escape) no
  longer silently postpones the update prompt for two days — you'll be asked again next launch.
- Security: license keys are now unique per Boek Solutions product, even on the same computer.
  If you have an existing license and it's no longer recognized after updating, this is expected —
  email info@boeksolutions.nl with your Machine ID for a replacement key, a one-time step.

## v1.0.1 (2026-07-07)

- Security: strengthened how license keys are generated and validated. If you have an existing
  license and it's no longer recognized after updating, this is expected — email
  info@boeksolutions.nl with your Machine ID for a replacement key, a one-time step.

## v1.0.0 (2026-07-07)

- First release: WPF port with Light/Dark/Book themes, offline licensing (14-day trial), auto-update.
