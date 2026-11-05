# On-prem-infrastruktur – tre projekt

Tre projekt där jag byggt klassiska Windows Server-miljöer i Hyper-V: från en serverpark med DFS, RDS, VPN och SCCM till en komplett miljö med Exchange för 150 användare. Projekten gjordes under utbildningen till Moln- och virtualiseringsspecialist på Campus Mölndal, november 2025–februari 2026.

> Alla företag, domäner och användare är fiktiva labbdata.

## Projekten

| Projekt | Period | Typ | Innehåll |
| --- | --- | --- | --- |
| [Project Success](01-project-success/README.md) | Jan–feb 2026 | Grupp, fyra personer. Jag var teamleader och AD-ansvarig | AD med import av 150 användare via PowerShell, filserver med RAID 5, NTFS och ABE, Folder Redirection, RDS med Office, Exchange på RAID 1 med två domäner, delade mailboxar och resursmailboxar |
| [Exchange-labb](02-exchange-lab/README.md) | Jan 2026 | Individuellt | Mailboxar, delad mailbox, distributionsgrupp, mötesrum och resurser, extra e-postdomän, Outlook via Autodiscover. Tio skärmbilder. |
| [Novatrix On-Prem Build](03-novatrix-server-build/README.md) | Nov 2025 | Grupp, tre personer | DFS på två filservrar, RDS och RemoteApp med certifikat via GPO, L2TP/IPsec-VPN, SCCM compliance, GPO:er för USB, lösenord och brandvägg, backup med arkivering och DFS-R |

I grupparbetena deltog alla i alla delar. Klasskamraterna kallas gruppmedlemmar.

## Teknik

Windows Server 2022 · Active Directory · DNS · DHCP · Group Policy · RAID 1 och RAID 5 · NTFS och Access-Based Enumeration · Folder Redirection · DFS-N och DFS-R · Remote Desktop Services och RemoteApp · RD Web Access · RRAS (L2TP/IPsec) · System Center Configuration Manager · Exchange Server · Outlook och Autodiscover · Windows Server Backup · PowerShell · pfSense · Hyper-V

## Vad projekten visar

- **Bredd i serverroller:** katalogtjänst, filer, fjärrskrivbord, VPN, e-post, klienthantering och backup i samma miljöer.
- **Behörigheter med grupper:** GG→DL-modellen, grupper i grupper och Access-Based Enumeration.
- **Automatisering:** OU-struktur och 150 användare importerade med PowerShell.
- **Verifiering från klienten:** e-post, delade mailboxar, resursbokningar och Autodiscover testade från Outlook.
- **Kritisk granskning:** vid portföljarbetet hittades och märktes flera tekniska fel och oklarheter i grupprapporterna. Se [CHANGES.md](CHANGES.md).

## Struktur

```text
onprem-infrastructure-projects/
├── 01-project-success/
│   ├── README.md
│   └── scripts/            OU-struktur och användarimport
├── 02-exchange-lab/
│   ├── README.md
│   └── screenshots/
├── 03-novatrix-server-build/
│   └── README.md
└── CHANGES.md
```
