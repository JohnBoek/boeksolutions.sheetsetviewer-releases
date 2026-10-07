---
name: github-workflow
description: "Bereid commits, pull requests, versienummers of een gevraagde GitHub-release voor volgens de lokale repositoryafspraken. Gebruik geen publicatiestappen bij een gewone tekst- of code-edit."
---

# GitHub-workflow

Lees .github/GITHUB-WORKFLOW.md en alleen de relevante projectspecifieke releasepolicy. Gebruik repository-profile.json als routekaart; null-velden zijn niet ingericht en vormen geen opdracht om ontbrekende infrastructuur te maken.

Lees .github/VERSIONING.md bij build-/versie-/releasewerk: een reviewbuild krijgt een aparte PR/run/poging-identiteit en verhoogt de stabiele productversie niet. Gebruik .github/PROJECT-BOARD.md voor borden en labels; neem dit per project mee zonder bulkpublicatie.

Volg .github/NAMING.md bij nieuwe repos of een gevraagde hernoeming: lowercase organisatie.project[-rol], met een identieke vaste hoofdmap. Een bestaande afwijking blokkeert gewoon werk niet.

Controleer echte repository/branch, scope, gebruikersautorisatie en bestaand werk. Bereid het concrete resultaat en passende checks voor. Behoud staging, gepubliceerde geschiedenis, productversiebron en distributiekanalen.

Een PR bevat probleem, resulterend gedrag en echte verificatie; bestaande issue- en projectnummers komen van GitHub. Geen verplicht nieuw issue of brede review voor een triviale wijziging. Publiceer releases alleen binnen de opdracht, met het gecontroleerde artifact en verificatie van de werkelijke download voordat een feed wijzigt.

Ontbrekende GitHub Projects-toegang blokkeert gewone ontwikkeling niet. Vraag alleen noodzakelijke ontbrekende projectidentiteit/toegang wanneer de taak echt een bord moet aanpassen; wijzig auth-scopes niet stilzwijgend.

Gebruik de beheerde standaardenupdate alleen bij templateonderhoud of wanneer een ontbrekende relevante basis moet worden toegevoegd. Geen sync over alle repos na elke codewijziging. Rapporteer lokaal voorbereid, gecommit, gepusht, gemerged en gepubliceerd als afzonderlijke werkelijk uitgevoerde stappen.
