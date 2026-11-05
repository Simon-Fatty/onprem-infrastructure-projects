# Ändringar vid portföljarbetet

Repot byggdes i oktober 2026 av tre rapporter: Project Success (grupp, jan–feb 2026), Exchange-labbet (individuellt, jan 2026) och Novatrix On-Prem Infrastructure Build (grupp, nov 2025). Den här filen visar vad som är originalarbete och vad som ändrats.

## Sanering

- Rapporterna är omskrivna till Markdown. Klasskamraternas namn är borttagna och PDF-metadata följer inte med.
- Lärarens uppgiftstext, som inledde Project Success-dokumentet, ingår inte. Målen är beskrivna med egna ord.
- Listorna med testanvändare från CSV-filerna ingår inte.
- Startlösenordet i Project Success-skriptet är ersatt med `Read-Host -AsSecureString`, som frågar en gång före loopen i stället för att stå i klartext.
- Exchange-skärmbilderna: bokmärkesraden i webbläsaren och värddatorns namn i två titelrader är borttagna.
- Nätverksdiagrammen är omritade i Mermaid.

## Rättelser i skripten

| Skript | Problem | Rättning |
| --- | --- | --- |
| `Import-Users.ps1` | Kodblocket i dokumentationen saknade avslutande klamrar och gick inte att köra | Klamrarna tillagda, med ett meddelande när användaren redan finns |
| `Import-Users.ps1` | Saknades rot-OU:n skapades en OU med namnet "Anstallda", fast skriptet använder `OU=Super` | Namnet rättat till `Super` |

## Rättelser och oklarheter i dokumentationen

Var och en är också märkt i texten.

| Projekt | Var | Rättelse |
| --- | --- | --- |
| Project Success | Office 2013 på RDS | *Shared computer activation* gäller Microsoft 365 Apps. Office 2013 på RDS kräver volymlicens. |
| Novatrix Build | USB-blockering | Säkerhetsfiltrering på en datorprincip väljer datorer, inte användare. Undantaget för SEC-IT fungerar inte som det beskrevs. |
| Novatrix Build | SCCM | Baselinen "Defender Active" kontrollerar brandväggen, inte Defender |
| Novatrix Build | VPN och RDS | Oklart om VPN körs på SRV-DC-01 eller SRV-RRAS-01, och om RD Gateway användes trots att RDS bara skulle nås via VPN |
| Exchange-labbet | Certifikat | Beskrivningen av hur certifikatvarningen löses är skriven vid portföljarbetet |
