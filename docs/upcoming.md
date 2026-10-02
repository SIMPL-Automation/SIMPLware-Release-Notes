# Upcoming Release

There's a new release that will be ready soon! These release notes are **incomplete** and **subject to change**.

# v3.1.5 - Mind the gap
<div class=h1Subtitle>
2026.10.02
</div>

## ✨ Shiny new stuff
Sorry, just the shiny old stuff for now 〰️

## ⏫ Level-ups
### 📐 Safer Mantis tote gap detection [#8464]
Mantis now checks that the **tote gap is wide enough** before extracting — if not, it uses a **rib grab** instead of risking a push or misalign.

- RMS now passes a configurable **gap size** for gap search (firmware no longer stuck on the default) [#8649]

## 🪲 Bug fixes
Nothing to see here 🙈

## 💽 Firmware updates
### Mantis 2.6
- NXP: `v1.13.0-8-g9886a82`

### Mantis 2.5
- NXP: `v1.13.0-8-g9886a82`

## 🧪 Development improvements
- IMS can now create Mantis containers (Kafka mapper for Mantis container type was missing) [#8641]

## 🚧 Known issues
- IOCS can stop receiving Pub/Sub messages with no clear error until it is restarted [#8657]
- Robots cannot be manually moved while inside locked Safety Zones [#8226]
- Ants can sometimes form 4-way gridlocks [#8109]
- Pressing Escape on the Flo Tote Induction screen does not return to the Workstation Detail screen when the tote label field has focus [#8342]
- The on-screen keyboard cannot be used during Flo Tote Induction [#7905] [#7907]
- Workstations sometimes show as Off on the Flo Workstation and Workstation Detail screens when Tote Induction is enabled [#7779]
- After RVS starts, some Mantis robots can appear without bay assignments until statuses catch up [#8599]
- Ants never show in "Moving" state [#7294]
- CTS sometimes takes a long time to update container tags [#6576]
- The "No children" indication on the Flo Workstation Detail screen is confusing [#7402]
- On the Flo Containers screen, when lots of filters are selected, there is no room on smaller screens for the tote cards [#7851]

## 🚀 Deployment notes
- **New robot firmware?**: YES
- **New Flo APK?**: NO
- **New backend services**: NONE
- **Updated backend services**: IMS, RCS, RMS
- **Database migrations**: NONE
- **Helm configuration changes**: NONE
- **Downtime requirements**: 30 minutes full system downtime
