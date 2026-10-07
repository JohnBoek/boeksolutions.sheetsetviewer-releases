# GitHub-afspraken

Deze gedeelde basis geldt bij wijzigingen, commits, pull requests en releasewerk. De bestaande projectspecifieke build-, data- en distributieregels blijven leidend voor hun domein. Lees alleen het deel dat de taak raakt; dit is geen extra volledige checklist na iedere edit.

## Reponamen

Bij nieuwe repos of een gevraagde hernoeming: volg [NAMING.md](NAMING.md). Gebruik `boeksolutions.<project>[-<rol>]`, volledig lowercase; GitHub-naam en vaste lokale hoofdmap zijn gelijk. Bestaande afwijkingen blokkeren gewone wijzigingen niet en worden niet automatisch hernoemd.

## Gewone wijzigingen en pull requests

- Controleer repository, huidige branch en lokale wijzigingen. Behoud andermans werk en staging. Werk op een passende branch wanneer een PR onderdeel van de opdracht is; verander niet stilzwijgend de branch van een lopende taak.
- Houd commits en PR's samenhangend. Stage expliciete bestanden. Geen generieke git add ., stash/reset/clean of wijziging van gepubliceerde geschiedenis om een vuile checkout te verbergen. Bij Lovable/sync-branches kan push direct effect hebben.
- Een PR beschrijft probleem, resultaat en echte verificatie. Gebruik .github/pull_request_template.md, maar houd een kleine wijziging kort. Link bestaande relevante issues; geen verplicht issue, modelreview of tweede reviewer voor iedere typofix.
- Gebruik een draft-PR als werk of vereiste controle nog openstaat. Controleer diff, doelbranch, relevante checks en openstaande reviewbevindingen voordat een gevraagde merge plaatsvindt. Claim een check niet als uitgevoerd wanneer alleen de configuratie bestaat.
- Commit, push, PR, merge en publicatie volgen de gebruikersopdracht. Een passende reeds gegeven autorisatie hoeft niet telkens opnieuw gevraagd. Schrijven aan een PR is geen toestemming voor release of productie-deploy.

## Bord en labels

Gebruik [PROJECT-BOARD.md](PROJECT-BOARD.md) en [labels.json](labels.json) bij inrichting of relevant PR-/releasewerk. Hergebruik het bestaande bord; kopieer de basis alleen bij een gevraagde projectinrichting. Voeg ontbrekende labels gericht toe met scripts/Sync-GitHubLabels.ps1; behoud maatwerk. Geen bulkpush of labelsynchronisatie over alle repos na iedere edit.

## Nummers en versies

- GitHub kent issue- en PR-nummers toe; bedenk, reserveer of hernummer ze niet handmatig. Verwijs buiten de huidige repo als owner/repo#nummer. Gebruik een sluitingswoord zoals Closes alleen wanneer de PR dat concrete issue echt oplost.
- Een GitHub Projects-bord heeft een afzonderlijk owner/projectnummer. Neem alleen een geverifieerde bestaande koppeling over in repository-profile.json. Null betekent niet ingericht; het is geen project 0 en blokkeert codewerk niet. Maak niet voor elke repo automatisch een bord.
- **Reviewbuilds verhogen de stabiele productversie niet.** Lees [VERSIONING.md](VERSIONING.md) bij versie-/build-/releasewerk. Gebruik een aparte PR/run/poging-identiteit en reviewkanaal. Verhoog de productversie eenmaal bij een bewuste productrelease; technische uploadnummers zijn afzonderlijk.
- Gebruik de bestaande versiebron: csproj/props, Android display/versionCode, package.json, AL app.json of de expliciete releaseprocedure. Verhoog niet alle nummers na iedere commit. Een nieuwe distributierelease krijgt een passend nieuw versienummer; SemVer kan bij libraries/apps, maar behoud product- en store-eisen.
- Android versionCode stijgt per bedoelde upload; test-entitlements en signingprofielen moeten kloppen. Windows/AL hebben eigen numerieke/installer-versievoorwaarden. Synchroniseer app, installer, tag en feed waar de bestaande pipeline dat vereist; kopieer niet willekeurig een tagnummer naar elk versiebestand.
- Release- en key-repos kunnen alleen artifacts of administratie bevatten. Geef die niet automatisch een appversie, buildworkflow of publieke publicatie. Keyregistraties blijven binnen hun eigen vertrouwelijkheidsregels.

## Publiceren

Gebruik de bestaande releasepipeline en publicatierepository. Bereid de concrete versie en releasenotes voor, test het werkelijk te distribueren artifact en controleer debug/testinstellingen. Een lokale Release-configuratiebuild is niet automatisch een distributierelease.

Publiceer alleen binnen de opdracht. Bij releases: controleer het bedoelde commit/tag/artifact en verifieer na upload de daadwerkelijke download en digest. Wijzig een updatefeed pas wanneer het juiste artifact beschikbaar en gecontroleerd is. Bestaande releases/assets/tags worden niet stilzwijgend vervangen of verplaatst. Bij onbekende uploaduitkomst eerst de externe status controleren; geen onbeperkte retries.

Gegenereerde releasenotes zijn een concept: controleer gebruikersbetekenis en compatibiliteit en haal interne notities of gevoelige gegevens eruit. Deze YAML-config maakt geen release en verzendt niets.

## CI en repository-instellingen

Hergebruik bestaande checks. Een wijziging aan documentatie hoeft niet elk platform te bouwen; een gedeelde API-/dependency-/releasewijziging wel de relevante controles. Verplicht geen statuscheck die nog niet bestaat, want die zou merges blokkeren.

Nieuwe workflows gebruiken minimale expliciete permissions en passende timeouts. Verleen write-toegang alleen aan de publicatiestap die het nodig heeft. Geen secrets of schrijfrechten voor code uit een niet-vertrouwde PR; gebruik pull_request_target niet om onbetrouwbare head-code met privileges uit te voeren. Pin externe actions naar gecontroleerde revisies en onderhoud updates; kopieer geen verouderde actionversies als universele eis.

Rulesets/branch protection, reviewaantallen, CODEOWNERS, labels, environments en projectkoppelingen zijn GitHub-instellingen. Kies ze passend bij team en risico en pas ze alleen toe binnen de opdracht. Voor een solo-project geen onhaalbare verplichte tweede goedkeurder. Gebruik waar passend checks en een duidelijke mergebeslissing.

## Toepassen en onderhouden

AGENTS.md verwijst naar deze afspraken; de github-workflow-skill wordt gebruikt wanneer een GitHub-/releasehandeling aan de orde is. Nieuwe projectprofielen krijgen deze basis automatisch. Bestaande repos krijgen de lokale bestanden, zodat agents ze in volgende wijzigingen kunnen volgen. GitHub zelf toont templates pas nadat ze op de default branch zijn gekomen.

De template bevat scripts/Sync-GitHubStandards.ps1 voor gerichte updates. Het script werkt alleen door hem beheerde, ongewijzigde bestanden bij en meldt maatwerk/conflicten; het overschrijft geen bestaande workflows, secrets of productbeleid. Geen automatische netwerkcontrole of brede synchronisatie bij elke code-edit.

Primaire naslag: [PR-templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository), [issueformulieren](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-issue-forms), [Projects-workflows](https://docs.github.com/en/issues/planning-and-tracking-with-projects/automating-your-project/using-the-built-in-automations).
