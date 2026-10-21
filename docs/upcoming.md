# Upcoming Release

There's a new release that will be ready soon! These release notes are **incomplete** and **subject to change**.

# v3.1.6 - Shift happens
<div class=h1Subtitle>
2026.10.21
</div>

## ✨ Shiny new stuff
Sorry, just the shiny old stuff for now 〰️

## ⏫ Level-ups
### 📏 Container offset updates (backend only) [#8753]
Tilted uprights? **Shift containers into place** without touching a tote!

- Container offsets can now be updated through a **new ITS ReST endpoint**
- Every container inside **moves right along with it**, so the whole stack stays lined up
- This is a **backend-only** change for now, with no Flo screen yet

### 📡 Simpler robot MQTT setup [#8455] [#8294] [#8439] [#8473] [#8352] [#8382]
Setting up robot MQTT is now **one page, no guesswork**!

- All MQTT settings now live in **one place on the robot's web page**, with direct mode as the default
- A new **Simple mode** hides internal details, with an **Expert mode** for advanced setups
- Saved settings are now **applied in the background**, so the page no longer hangs or drops when the network reconnects

## 🪲 Bug fixes
- Mantis 2.6 robots no longer go offline and need a reboot after a firmware issue during shuffle operations [#8653] [#8666]
- Robots no longer occasionally lose connection from unused WiFi services, which are now off by default [#8251] [#8460]
- Ants on the dance floor are no longer blocked by an Ant parked under a workstation, caused by leftover reservations that were never cleared [#8756] [#8757]
- Mantis robots no longer risk falling when a homing sequence is aborted [#8684]
- Robots no longer wait an extra 20 seconds to power off, including during emergency shutdowns [#8310]
- Overheight sensors at workstations are now matched to the right workstation, and every workstation now supports the overheight sensor bypass [#8794] [#8800] *(In Dev)*
- Tasks no longer hang because Mantis command updates were dropped by an overloaded message broker [#8630]
- Ants turned away from a full or no-longer-needed workstation no longer get stuck instead of leaving [#8772]
- Ants A-151 and A-152 can once again plan paths out of their rest positions [#8737]
- Locations are no longer tagged INACCESSIBLE when a task fails for reasons unrelated to that location [#8760]
- Tote compartment changes now happen in a single step, so a half-finished reconfiguration can't be left behind [#8752]
- Mantis and Ant LEDs no longer get stuck on one color pattern [#8598]
- Robot LED presets and settings no longer occasionally fail to sync to the LED controller [#8309]
- Downloading large logs from the robot's web page no longer fails partway through [#8474]
- Remote terminal access to robots no longer occasionally fails to start after a reboot [#8267]

## 💽 Firmware updates
### All robots
- Wormhole: [`v2.1.9-20261016.1`](https://simplautomation.sharepoint.com/:u:/s/Engineering-SIMPLEngineering/IQCsah7eAA1_TJuip_fV3ociAYGOxgDeetk54RlO68Jd8xc?e=8KFhVI)

### Mantis 2.5
- NXP: [`Mantis-hwA4-v1.14.0-1-gd45a1fe-20261016.1`](https://simplautomation.sharepoint.com/:u:/s/Engineering-SIMPLEngineering/IQCioQ3x_gI3RJoulIvSy2j0AbxoGIZZ92Z94Wu_nEhc_X8?e=aikz9y)

### Mantis 2.6
- NXP: [`Mantis-hwC1-v1.14.0-1-gd45a1fe-20261016.1`](https://simplautomation.sharepoint.com/:u:/s/Engineering-SIMPLEngineering/IQBnSLOcVSNvR5fiFtpMOU9xAdcYvltDuEwouRpVRCEkqMQ?e=ksJuej)

## 🧪 Development improvements
- Robots now shut down cleanly when they detect an incoming power loss, so logs and files are no longer cut off mid-write [#8427]
- Extended the Ant layout to the newly commissioned aisle 3 in Locust Grove [#8768]
- Robots now detect their CAN bus speed automatically instead of relying on a fixed setting per robot type [#8726]
- The network link between the Wormhole and the robot's main controller now negotiates a stable, fixed speed [#8325]
- Moved the LM ReST layer from Flask to FastAPI for more reliable messaging [#8725] [#8685]
- Motor controller firmware upgrades no longer time out partway through [#8751]
- WiFi setting changes on the robot's web page no longer fail silently after being saved [#8528]
- Robot crash logs are now kept after an unexpected reboot, so crashes can be debugged without a live serial connection [#8128]
- Robots no longer drop their first startup log messages, so version and reset-reason logs are always captured [#8099]
- CAN logging now starts reliably at boot, without waiting for the robot's clock to sync [#8475] [#8254]
- Robots now log WiFi roaming between access points (when WiFi is enabled), including how long each handoff takes [#8227]
- Robots can now capture 4G network traffic to help diagnose cellular connection issues [#8304]
- Robots now save their LED controller logs to the SD card for easier LED troubleshooting [#8326]
- The SD card can now be formatted from the System Tools panel on the robot's web page, with no command-line access needed [#8303]
- Robots now share network time with devices on their local network and name themselves after the robot for easier discovery [#8327]
- Robot network hostnames now update when the robot's label changes [#8592]
- Robot WiFi network interfaces have been renamed so they no longer clash with the 4G interface [#8402]

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
- **New robot firmware?** YES
- **New Flo APK?** NO
- **New backend services:** NONE
- **Updated backend services:** AMS, DPS, GAS, IMS, ITS, LM, MOM, RCS
- **Database migrations:** NONE
- **Helm configuration changes:** NONE
- **Downtime requirements:** 45 minutes full system downtime
