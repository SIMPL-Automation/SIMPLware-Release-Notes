# Upcoming Release

There's a new release that will be ready soon! These release notes are **incomplete** and **subject to change**.

# v3.1.4 - Bits and bots
<div class=h1Subtitle>
2026.09.24
</div>

## ✨ Shiny new stuff
Sorry, just the shiny old stuff for now 〰️

## ⏫ Level-ups
Steady as she goes 🚢

## 🪲 Bug fixes
- Mantis extracts fail less often when the tote is sitting a bit too close to the Mantis [#8446]
- Ants rejected at a workstation entrance are no longer sometimes sent straight back to that same workstation [#8454]
- Robots no longer sometimes get stuck with a stale state reservation after being cleared [#8459] *(In QA)*
- After an Ant finishes a move, the path it was using is now reliably cleared so other Ants aren’t blocked behind it [#8465]
- Reconfiguring tote compartments no longer leaves the tote as "Deleted" in Flo [#8449] [#8468]
- After an Ant drops a tote at a P&D and skips the next pickup there, it no longer keeps holding the P&D so other Ants shove totes off it [#8467] [#8491] *(In QA)*
- The Flo Workstation and Workstation Detail screens no longer show that a workstation is requesting something when nothing is actually being requested [#8495]
- `tote.moved` Kafka messages no longer project the wrong orientation for orphaned totes [#8497]
- Missing tote gap and overheight sensors have been added to the Flo Mantis Detail screen [#8483] [#8461]
- The accessible switch on the Flo Tunnel Detail screen now takes effect on the first press [#8463]

## 💽 Firmware updates
No firmware updates required! ✅

## 🧪 Development improvements
NONE

## 🚧 Known issues
- Robots cannot be manually moved while inside locked Safety Zones [#8226]
- Workstations sometimes show as Off in Flo when Tote Induction is enabled [#7779]
- Ants can sometimes form 4-way gridlocks [#8109]
- Ants never show in "Moving" state [#7294]
- CTS sometimes takes a long time to update container tags [#6576]
- The on-screen keyboard cannot be used during Flo Tote Induction [#7905] [#7907]
- The "No children" indication on the Flo Workstation Detail screen is confusing [#7402]
- On the Flo Containers screen, when lots of filters are selected, there is no room on smaller screens for the tote cards [#7851]
- Robots drop some logs at startup [#8099]
- Pressing Escape on the Flo Tote Induction screen does not return to the Workstation Detail screen when the tote label field has focus [#8342]

## 🚀 Deployment notes
- **New robot firmware?**: NO
- **New Flo APK?**: v4.6.21
- **New backend services**: NONE
- **Updated backend services**: AVS, GAS, IMS, MOM, RES, RMS
- **Database migrations**: NONE
- **Helm configuration changes**: Flo `CT_CONTAINER_TAG_UPDATE` updated for [#8463] (accessible switch timeout) — auto-applied at deploy time
- **Downtime requirements**: 30 minutes full system downtime
