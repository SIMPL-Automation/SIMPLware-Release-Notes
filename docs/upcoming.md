# Upcoming Release

There's a new release that will be ready soon! These release notes are **incomplete** and **subject to change**.


# v3.1.2 - Pick up the pace!
<div class=h1Subtitle>
2026.09.11
</div>

## ✨ Shiny new stuff
Sorry, just the shiny old stuff for now 〰️

## ⏫ Level-ups
### 💪 Flo enhancements
Flo is now more **stable**, **accurate**, and **performant**!

- Updates to the Areas and Area Detail screens are **faster** [#7978]
- You are now only allowed to have a **single Flo browser tab** open at a time. This ensures Flo doesn't use too many resources on your device, degrading performance [#8276]
- Tapping the **robot alert icon** now removes any previous filters you had applied [#7828]
- **Task creation failures** now show separately from task failures [#8214]
- **Startup** is a lot faster! [#8252]
- Flo has been upgraded to use **MQTT 5** [#8324]
  - This allows Flo to take advantage of **EMQX broker queueing** so it no longer misses any push updates during brief disconnects
  - This resolves several issues where Flo sometimes presented outdated information throughout the app, including:
    - Container enabled / disabled state
    - Safety Zone lock states [#8328]
    - Ant tote-onboard state during tote induction [#8189]
- Additional protections have been added to make sure Flo never shows Ants with totes onboard that aren't really there during Tote Induction [#8190] [#8189]

### 🦺 Keep an eye on locked Safety Zones [#8239]
Locked Safety Zones are now **always visible** in the Flo Layout screen.

![Locked Safety Zones](_media/screenshots/3.1.2/LockedSafetyZones.png)

### 📦 Flo teleport enhancements [#8289] [#8277]
Flo now supports teleporting totes to **Storage P&Ds** and **DPS Workstation shelves**.

![Teleport to DPS](_media/screenshots/3.1.2/TeleportToDps.png)

### 🚦 Ant failure detours [#8316]
Ants will now take **detours** around other Ants that have **failed tasks**.

## 🪲 Bug fixes
<!-- - TBD - Dan F [#8099] -->
<!-- - TBD - Team QA [#7129] -->
- Flo no longer sometimes shows that workstations are "Requesting" something when they are not [#7036]
- Flo no longer allows Ants to carry more than one tote in some cases during Tote Induction [#8057] [#8062]
- Some Flo icons are no longer off-center on smaller screens [#8263]
- Mantises now correctly select totes for delivery to workstations after bay purview changes [#8299]
- Ants no longer get stuck under P&Ds after depositing due to incorrect container reservations [#8125]
- Ants don't wait as long under P&Ds after dropping off totes with inventory [#8191] [#7228]
- Ants no longer travel to invalid locations due to incorrect destination shortening [#8261] [#8280]
- Ants no longer get stuck entering workstations due to various issues [#7824] [#8290] [#8288]
- Ants no longer fail tasks in some Exit task replanning cases [#8293]
- Workstations no longer receive extra empty containers at startup in some cases [#8187] [#8317]
- Ants no longer get stuck after being cleared while exiting DPS workstations [#8193]
- Tote orientations are now correctly emitted in `tote.moved` Kafka messages [#8295]
- Container tagging is faster, improving performance of several operations including Flo container enablement [#6576]

## 💽 Firmware updates
### Ant 3.1
TBD

### Ant 3.0
TBD

## 🧪 Development improvements
- All logs from all bots are now published to the Puls environment from the new BLT service [#6143] [#7634] [#7733]
- Performance improvements for GAS and DPS container move processing [#8031]
- Workstations are now configured correctly in QA environments [#7658]
- MOM now publishes specific failure reasons when tagging a tunnel as inaccessible. This will be used later in Flo [#8156]
- `move.container` Kafka API now accepts orientations to rotate containers upon move. This will be used later for Flo teleportation [#8292]
- Flo now correctly shows bay assignments in fresh QA environments [#8336]
- A new environment variable has been added to IOCS to allow disabling of incoming messages for testing purposes [#8279]

## 🚧 Known issues
- Robots cannot be manually moved while inside locked Safety Zones [#8226]
- Workstations sometimes show as Off in Flo when Tote Induction is enabled [#7779]
- Ants can sometimes form 4-way gridlocks [#8109]
- Ants never show in "Moving" state [#7294]
- The on-screen keyboard can not be used during Flo Tote Induction [#7907]
- The "No children" indication on the Flo Workstation Detail screen is confusing [#7402]
- On the Flo Containers screen, when lots of filters are selected, there is no room on smaller screens for the tote cards [#7851]

## 🚀 Deployment notes
- **New robot firmware?**: YES
- **New Flo APK?**: vTBD
- **New backend services**: BLT
- **Updated backend services**: ADAS, AMS, AVS, CTS, CVS, DPS, GAS, IMS, IOCS, LM, MOM, RES, RVS, TOM
- **Database migrations**: NONE
- **Downtime requirements**: 1 hour of full system downtime
