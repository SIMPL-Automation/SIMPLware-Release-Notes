# Upcoming Release

There's a new release that will be ready soon! These release notes are **incomplete** and **subject to change**.

# v3.1.7 - Puls check
<div class=h1Subtitle>
2026.10.28
</div>

## ✨ Shiny new stuff
### 📡 Bot log streaming [#8736] [#7912] [#7634] [#8265] [#8480] [#8519] [#8520] [#8521] [#8285] [#8287] [#8593]
Robot logs can now **stream live to Puls**! *(In Dev)*

![Bot log streaming](_media/screenshots/3.1.7/BotLogStreaming.png)

- Logs flow from each robot's Wormhole board through the POP service to the **cloud log broker**
- The Puls PUT service stores the **raw robot logs** in TimescaleDB
- The RAP service can pull **all logs and task-failure logs** together
- The RAP service can pull a **whole day of fleet logs** on request

## ⏫ Level-ups
### 🦾 Mantis init with arms out [#8538]
Mantises can now be initialized **even with their arms out**! No more entering Mantis aisles to manually push them back in!

### 🚚 Migrate totes across aisles [#8723]
**Tote Migration** now supports moving totes **between aisles**! *(In Dev)*

- A tote's destination is no longer limited to what its **current Mantis** can reach
- Migrations still name a source and a destination, so **nothing changes** about how a move is requested
- No integration with Flo yet; Ants must be manually put in Tote Migration mode using the `robot-process.update` Kafka topic

### 📊 Puls 2.0 [#8419] [#7733] [#8330] [#8524] [#8531] [#8637] [#8810] [#8231] [#8422] [#8424] [#8533]
Puls now runs on **TimescaleDB**! *(In Dev)*

- The Puls PUT service now reads and writes Puls data in **TimescaleDB** instead of CockroachDB
  - This enables better long-term **compression and archiving** features to support massive amounts of data!
- Puls SQL views are now **created automatically** for each tenant and site

## 🪲 Bug fixes
- Storage robots no longer pause between tasks and slow or stop tote delivery to workstations during heavy load [#8848]

## 💽 Firmware updates
### All robots
- Wormhole: `TBD`

### Mantis 2.5
- NXP: `TBD`

### Mantis 2.6
- NXP: `TBD`

## 🧪 Development improvements
- puls-admin Timescale commands no longer fail partway through when run over a kubectl port-forward [#8682]
- The puls-admin dev container now works on Home Depot laptops by trusting the corporate certificate authority [#8597]
- The NXP log analyzer tool can now start a local Superset to explore robot log data [#8498]

## 🚧 Known issues
- IOCS can stop receiving Pub/Sub messages with no clear error until it is restarted [#8657]
- Robots cannot be manually moved while inside locked Safety Zones [#8226]
- Ants can sometimes form 4-way gridlocks [#8109]
- During multi-aisle Tote Migration, Ants in Tote Migration mode with nothing to do sit idle at their last location instead of moving to rest, which can block a Mantis from finishing its migration [#8868]
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
- **Updated backend services:** CTB, MOM, POP, PUT, RAP
- **Database migrations:** New raw robot log tables in TimescaleDB for PUT [#8736]; new `source` column on every Puls table, with existing CockroachDB data copied over using puls-admin [#8524]
- **Helm configuration changes:** New bot-log EMQX broker config, the POP relay flag `pop.topics.bot-logs.enabled`, and PUT bot-log settings [#8660]; TimescaleDB TLS client certificates [#8643]
- **Downtime requirements:** All Mantises in Manual with no tasks for 15 minutes
