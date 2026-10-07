# Namen van repositories en hoofdmappen

Voor nieuwe eigen BoekSolutions-repositories gebruiken we **lowercase**, met een punt tussen merk en project en een koppelteken voor een afzonderlijke rol:

```text
boeksolutions.<project>[-<rol>]
```

Voorbeelden: `boeksolutions.libsync`, `boeksolutions.libsync-keys`, `boeksolutions.libsync-releases`, `boeksolutions.sheetseteditor` en `boeksolutions.business-central`.

Dit is onze consistente schrijfwijze, geen technische GitHub-eis dat een punt beter is dan een koppelteken. De punt scheidt merk en project; de rol hoort bij hetzelfde project. De volledige naam is de repositorynaam. Gebruik dezelfde schrijfwijze voor de GitHub-repository en de vaste lokale hoofdmap.

## Vaste regels

- Alleen ASCII-letters a-z, cijfers en koppeltekens binnen elk deel; precies een punt tussen merk en project. Geen hoofdletters, spaties, underscores, extra punten, accenten, dubbele koppeltekens of afsluitend koppelteken.
- Projectnamen zijn stabiel. Schrijf geregistreerde productnamen als een geheel: `libsync`, `photoboekkeeper`, `sheetseteditor`, `sheetsetviewer`, `lottobeheer`. Voor een naam uit losse woorden kan een koppelteken: `business-central`, `project-templates`.
- De hoofdrepo heeft geen overbodig `-app` of `-main`. Gebruik `-releases`, `-keys`, `-docs` of `-tools` alleen voor een echte afzonderlijke repository met die rol. Een platformachtervoegsel zoals `-android` of `-web` is alleen nodig als dat product bewust meerdere platformrepos heeft.
- Geen versie, datum, `beta`, `final`, `nieuw` of kopienummer als ontwikkelvariant achter de repo. Gebruik branches, tags en de reviewversies uit [VERSIONING.md](VERSIONING.md). Een echte productnaam met zo'n woord is geen reden om het product te hernoemen.
- Kies een korte naam. De nieuwe-projectgenerator hanteert maximaal 80 tekens als praktische interne grens; dit is geen claim over de maximale GitHub-lengte.
- Product-/schermnamen zoals LibSync, .NET-namespaces zoals BoekSolutions.LibSync, package-/application-ID's en interne bestanden behouden hun eigen conventie. Hernoem dus niet recursief alle bestanden naar lowercase. AGENTS.md, README.md, SKILL.md en andere door tools voorgeschreven namen blijven exact zoals vereist.
- Externe clones/forks behouden bij voorkeur hun upstream-identiteit. Codex/Git-beheerde worktreemappen en tijdelijke testmappen hoeven niet de vaste checkoutnaam te krijgen. Niet elke map onder repos is een Git-repository.

## Nieuwe projecten

De generator gebruikt standaard merk `boeksolutions`. `-Name` is de project-/weergavenaam; de repo-/mapnaam wordt apart bepaald. Bijvoorbeeld:

```powershell
./scripts/New-Project.ps1 -Profile windows-wpf -Name LibSync -Destination ../boeksolutions.libsync
./scripts/New-Project.ps1 -Profile generic -Name MijnTool -RepositoryName boeksolutions.mijn-tool -Destination ../boeksolutions.mijn-tool
```

Zonder RepositoryName wordt de naam opgebouwd uit merk, een punt en de lowercase Name (punten in Name worden koppeltekens). Geef RepositoryName expliciet als een vaste projectsleutel al bestaat. Een ander merk kan bewust via Organization worden opgegeven; de regels voor lowercase en scheidingstekens blijven gelden.

De laatste mapnaam moet exact gelijk zijn aan de repo-/mapnaam, inclusief lowercase. De generator controleert dit voordat hij bestanden schrijft. Hij hernoemt niets en maakt geen GitHub-repository aan. De gegenereerde PROJECT.md en template-origin.json bewaren beide de repo-/mapnaam.

## Bestaande repositories

Een bestaande afwijkende naam blokkeert gewoon projectwerk niet. Geen automatische hernoeming of extra controle na iedere edit. Nieuwe namen gelden direct voor nieuwe repos; bestaande namen trekken we per project gelijk bij een expliciete hernoemtaak.

Voor zo'n hernoeming: verifieer eigendom, de echte Git-root, huidige wijzigingen/staging, worktrees, actieve taken en het doelpad. Controleer verwijzingen in scripts, oplossingen, editor-/Codex-projecten, CI, Git-remotes en publicatie-/updatekanalen. Een hoofdmap verplaatsen verandert niet vanzelf de GitHub-naam, namespaces of application-ID's. Bewaar bestaande data en laat lopend werk niet naar een verdwenen pad schrijven.

Bij een GitHub-hernoeming moeten lokale remotes en gebruikte verwijzingen worden bijgewerkt. Reken niet blind op redirects voor Pages, gehoste actions, feeds of andere integraties. Publicatie- en key-repos vragen daarom een gerichte controle. Windows-hernoemingen waarbij alleen hoofdletters veranderen moeten zorgvuldig via een gecontroleerde tussennaam plaatsvinden, binnen hetzelfde bedoelde pad en zonder bestaand doel te overschrijven.

Bron: [GitHub-repositories hernoemen](https://docs.github.com/en/repositories/creating-and-managing-repositories/renaming-a-repository).
