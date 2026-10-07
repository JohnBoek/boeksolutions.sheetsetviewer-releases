# Bord en labels gebruiken

De [BoekSolutions-projectbasis](https://github.com/users/JohnBoek/projects/1) is een privebord onder JohnBoek, gekoppeld aan de templatecatalogus. Het is een herbruikbaar kopieerbord. GitHubs officiele templatevlag voor Projects is voor organisatieborden; JohnBoek is een persoonlijk account.

## Bij een nieuw of bestaand project

Gebruik het bestaande projectbord wanneer dat er is. Maak alleen een kopie wanneer een bord onderdeel van de opdracht is of voor het project wordt ingericht; geen nieuw bord voor elke kleine codewijziging. In GitHub: bordmenu -> Make a copy. Via de CLI:

```powershell
gh project copy 1 --source-owner JohnBoek --target-owner JohnBoek --title 'Naam van het echte project' --format json
```

Gebruik het door GitHub teruggegeven nummer, controleer de kopie en koppel alleen de bedoelde repository. Bewaar de daadwerkelijke owner/number in repository-profile.json. Nummer 1 is het basisbord en hoort niet als actief bord van elk product te worden ingevuld. Repositorylinks en labels worden niet meegekopieerd. Laat de kopie prive tenzij anders gevraagd.

## Inrichting

- Werkbord: Backlog, Gepland, Bezig, Controle, Geblokkeerd, Gereed.
- Planning: open werk met Prioriteit (P0-P3), Soort, Platform, Doelversie en optionele Streefdatum.
- Releases: filter op Soort Release of Reviewbuild. Geen automatische publicatie vanuit deze weergave.
- Blokkades: alleen Geblokkeerd; leg een concrete reden vast in de kaart.

Geen verplichte sprint, storypoints, deadline of tweede reviewer. Gebruik echte issues/PR's als kaarten. Gereed betekent afgesproken werk en controles afgerond, niet noodzakelijk al uitgebracht. Een nieuwe kaart start in Backlog. Afgesloten items en gemergde PR's kunnen de bordstatus bijwerken; een kaart verplaatsen sluit zelf geen issue. Auto-add en auto-archivering staan in de basis uit.

## Labels

[labels.json](labels.json) bevat de afgesproken namen, kleuren en omschrijvingen. GitHub kopieert repositorylabels niet automatisch met een projectbord of repositorytemplate; voeg ontbrekende labels gericht toe wanneer de repo wordt ingericht of er relevant PR-/releasewerk plaatsvindt:

```powershell
./.github/scripts/Sync-GitHubLabels.ps1 -Repository JohnBoek/MijnRepo
./.github/scripts/Sync-GitHubLabels.ps1 -Repository JohnBoek/MijnRepo -Apply
```

Zonder Apply is dit alleen een voorstel. Bestaande labels en hun maatwerk blijven behouden. Geen bulktoepassing op alle repositories en geen labelcontrole na iedere lokale edit.

- Kies waar nuttig een soort: bug, enhancement, documentation, maintenance, dependencies of release. Voeg security toe voor een relevante beveiligingswijziging; plaats geen gevoelige details in een publiek issue.
- review-build markeert reviewdistributie. breaking-change meldt compatibiliteitsimpact. blocked meldt een echte blokkade. Geen van deze labels geeft toestemming voor publicatie, credentials of productieacties.
- Gebruik maximaal een priority:p0/p1/p2/p3-label indien prioritering helpt. Op een bord is Prioriteit de leidende planning; houd labels alleen gelijk wanneer beide bewust worden gebruikt, zonder dubbele verplichte administratie.
- skip-changelog is voor wijzigingen zonder relevante gebruikersnotitie, niet om belangrijke fixes of beveiligingsimpact te verbergen.
- Labels sturen de categorieen in release.yml; review-build is niet uitgesloten, omdat zo'n PR ook echte productverbeteringen kan bevatten.

Zie [VERSIONING.md](VERSIONING.md) voor productversies, reviewbuilds en platformuitzonderingen. Neem deze afspraken per project mee; wijzig bestaande pipelines pas wanneer dat onderdeel is van het werk aan dat project.

Bron: [GitHub-projecten kopieren](https://docs.github.com/en/issues/planning-and-tracking-with-projects/creating-projects/copying-an-existing-project).
