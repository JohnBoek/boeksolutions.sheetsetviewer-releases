# Productversies en reviewbuilds

Een gewone codewijziging, PR, merge, build of review verhoogt de normale productversie niet. Een reviewbuild is geen stabiele productrelease. Verhoog de productversie eenmaal wanneer een echte release bewust wordt voorbereid; tussentijdse testbuilds krijgen alleen een eigen buildidentiteit. De bestaande versiebron blijft leidend voor opslag en platformformaat.

## Drie afzonderlijke begrippen

| Begrip | Voorbeeld | Wanneer wijzigen? |
| --- | --- | --- |
| Productversie | `2.4.1` | Een bewuste nieuwe productrelease |
| Reviewidentiteit | `2.4.1-pr.123.482.1` | PR 123, CI-run-ID 482, poging 1; volgende poging krijgt `.2` |
| Technisch pakket-/uploadnummer | Android `versionCode`, Windows/AL numerieke versie | Alleen wanneer packaging of een bedoelde upload dat vereist; los van de zichtbare productversie |

Als de volgende productversie nog niet gekozen is, gebruik de bestaande basisversie voor de reviewidentiteit. Een prerelease van 2.4.1 sorteert onder de stabiele 2.4.1 en is dus geen updateroute naar of vanaf de productie-app. Het reviewkanaal is apart. Is 2.5.0 al de bedoelde volgende release, gebruik die basis consequent; verhoog hem niet opnieuw voor iedere review.

## Review en release candidate

- Voor een PR: `<basis>-pr.<prnummer>.<run-id>.<poging>`. Gebruik op GitHub `GITHUB_RUN_ID` en `GITHUB_RUN_ATTEMPT`; het runnummer alleen is niet uniek over meerdere workflows. Registreer ook commit-SHA, platform en artifact-digest.
- Zonder PR kan een echte CI-build `<basis>-dev.<run-id>.<poging>` gebruiken. Verzin geen PR-nummer. Voor een gekozen releasecandidate: bijvoorbeeld `2.5.0-rc.1`, daarna `2.5.0-rc.2`; uiteindelijk een gecontroleerde release `2.5.0`.
- Geef buildwaarden via CI/buildparameters of een tijdelijke pakketkopie door. Commit geen versie-bump terug vanuit elke PR-build. Gebruik een duidelijk REVIEW-kenmerk in scherm/artifact waar passend.
- Reviewartifacts standaard als CI-artifact bij de PR. Een aparte GitHub-release alleen wanneer die distributie gewenst is: `prerelease=true`, `make_latest=false`, unieke onveranderlijke tag. Geen stabiele updatefeed, WinGet-publicatie of productie-deploy. Het label `review-build` start op zichzelf geen publicatie.
- `+g<sha>` mag extra buildmetadata bevatten, maar SemVer negeert dat bij versievergelijking. Alleen een andere SHA achter `+` maakt dus geen hoger versienummer. Run-ID en poging staan daarom in het prereleasegedeelte.
- Promoot een reviewartifact niet blind: controleer de daadwerkelijke definitieve versie, configuratie en distributiechecks. Gepubliceerde stabiele tags en artifacts zijn onveranderlijk; andere inhoud vraagt een nieuwe release.

De optionele helper [Get-ReviewVersion.ps1](scripts/Get-ReviewVersion.ps1) berekent uitsluitend namen en schrijft niets:

```powershell
$version = ./.github/scripts/Get-ReviewVersion.ps1 -BaseVersion 2.4.1 -PullRequest 123 -BuildId 482 -Attempt 1 -Commit abcdef1
$version.ReviewVersion         # 2.4.1-pr.123.482.1
$version.InformationalVersion # 2.4.1-pr.123.482.1+gabcdef1
```

## Per platform

- **.NET/WPF:** zet de reviewidentiteit waar tekst is toegestaan, bijvoorbeeld InformationalVersion en artifactnaam. AssemblyVersion en FileVersion blijven geldig numeriek; bestaande vaste assemblyversies worden niet willekeurig aangepast. Windows-installers en updatebibliotheken kunnen andere versie-eisen hebben. Controleer hun parser voordat een suffix wordt gebruikt. Gebruik voor reviewdistributie een bewezen aparte testinstallatie/portable build of testidentiteit; laat een reviewbuild de productie-installatie of configuratie niet onbedoeld vervangen.
- **MSIX/Microsoft Store:** pakketversies zijn numeriek. Voor Windows 10/11 Store-pakketten is het vierde onderdeel gereserveerd en moet het bij bouwen 0 zijn. Gebruik dit dus niet als universele reviewteller. Leg reviewidentiteit afzonderlijk vast en volg de gekozen distributieroute.
- **Android/.NET MAUI:** ApplicationDisplayVersion/versionName is de zichtbare versie; ApplicationVersion/versionCode is een positief intern nummer. Een nieuwe Play-upload gebruikt een nog niet gebruikt, passend hoger versionCode, ook voor een testtrack. Het zichtbare productnummer hoeft daarvoor niet te veranderen. Beheer de teller centraal per applicationId, over tracks/workflows heen; leid hem niet blind af uit PR-nummer of runnummer. Play-promotie van hetzelfde artifact hoeft geen nieuw artifact te uploaden. Voor onafhankelijke reviewinstallaties kan een bestaand test-applicationId worden gebruikt, met passende signing en serviceconfiguratie; wijzig de productie-identiteit niet automatisch.
- **React/web/packages:** previewdeploy per PR met commit/buildidentiteit. package.json hoeft niet bij iedere preview te stijgen. Bij een gevraagde npm-prerelease: aparte prereleaseversie en expliciete dist-tag zoals `next`, nooit automatisch `latest`. Geen productiegegevens of productie-secrets in een onbetrouwbare PR-preview.
- **Business Central/AL:** app.json gebruikt vier numerieke onderdelen; een `-pr`-suffix hoort daar niet in. Bewaar reviewidentiteit in artifact/manifest. Als testinstallatie een hogere numerieke pakketversie vereist, genereer die in een tijdelijke buildkopie volgens de bestaande tenant-/pipeline-afspraak. Test in een sandbox. Verander het app-ID niet om reviewversies te omzeilen: dat heeft gevolgen voor app-identiteit en data. Stem latere upgradevolgorde bewust af; verhoog de bronversie voor productie niet na iedere test.
- **Docs, release-assets en keyregistraties:** geen fictieve appversie of buildteller toevoegen. De regels gelden alleen wanneer daadwerkelijk software wordt gebouwd of verspreid.

## Een stabiele release kiezen

Gebruik waar het product dat volgt SemVer: patch voor compatibele fixes, minor voor compatibele functies, major voor incompatibele wijzigingen. Kies eenmaal op basis van de totale release-inhoud. Labels helpen bij notities en triage, maar bepalen niet automatisch een bump of toestemming om te publiceren. Behoud een bestaande afwijkende product-/storeafspraak wanneer die vereist is.

Bij de eerste wijziging aan een bestaande review- of releasepipeline: maak deze scheiding expliciet en controleer dat een reviewrun de stabiele versiebron, feed en tags ongemoeid laat. Deze instructies installeren op zichzelf geen nieuwe buildpipeline en veranderen geen bestaande productnummers.

Bronnen: [SemVer](https://semver.org/spec/v2.0.0.html), [Android-versies](https://developer.android.com/studio/publish/versioning), [Windows Store-pakketversies](https://learn.microsoft.com/en-us/windows/apps/publish/publish-your-app/package-version-numbering), [AL-manifest](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-json-files).
