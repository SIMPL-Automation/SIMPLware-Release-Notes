# Upcoming Release

There's a new release that will be ready soon! These release notes are **incomplete** and **subject to change**.

# v3.1.0 - Meet TOM and MOM
<div class=h1Subtitle>
2026.08.16
</div>

## ✨ Shiny new stuff
### 🏎️ Mantises orchestration just got a lot faster [#7077]
Introducing **TOM** and **MOM**!

![TOM and MOM](_media/screenshots/3.1.0/TomAndMom.png)

- The **time Mantises have to wait** to be told what to do next has been dramatically reduced
- The new **Tote Optimization for Mantis (TOM)** service continually **ranks totes** for Mantis extraction as conditions on the ground change
- The new **Mantis Orchestration Mothership (MOM)** service takes advantage of **TOM's pre-planning**, and is able to **quickly** tell Mantises what to do when they are **empty-handed**
- MOM also orchestrates the **Ants** within the **Storage area**, but there are no major improvements here; this is a 1-for-1 replacement of functionality **previously** handled by **SASG**
  - That's right, **SASG is no more**; TOM and MOM are the new Storage area commanders.

## ⏫ Level-ups
Steady as she goes 🚢

## 🪲 Bug fixes
- Workstations demanding totes that have been deleted will still receive Ants to fulfill other eligible demand at the workstation [#8086] [#8088]
- Lots of Ant gridlock fixes [#7673]
- Ants no longer fail tasks due to action reservation creation failures in RES [#8047]
- Ants no longer gridlock due to overlapping reservations caused by small command reservation buffers [#8032]
  - This buffer is now configurable in RES
- Robots should no longer be blocked by other robots that are not nearby due to hanging reservations caused by some SIMPLware upgrades as well as command validation request timeouts [#7713] [#7773] [#7762] [#8048]
- Ants no longer deliver totes to Mantises that don't have any more space available [#8009] [#8015]
- Ants no longer get stuck at workstations after being dismissed due to a class cast exception in the SIMPL SDK [#8113]
- Ant Exit tasks should no longer fail with "Error in command rejection handling" [#8064]
- Mantises no longer try to extract totes in other aisles due to bad indexing of compartments, causing large blockages of other robots [#8034] [#8035]
- Ants no longer fail to enter workstations due to lack of container ancestor check retries [#7824] [#8041]
- Mantis extract tasks should no longer fail with "Expected State: armPosition" during re-grab retries [#8076]
- Ants no longer consistently overshoot their target commanded positions, resolving several issues [#7439] [#7382] [#7461] [#7713] [#7820] [#7842]
- Robots no longer show as offline in Flo about once every 10 minutes [#7978]
- Containers on the Flo Containers screen are now sorted by number correctly [#7362]
- Kafka brokers are no longer being killed due to excessive memory consumption, resolving several issues [#7974] [#7975] [#7977] [#7976] [#8019]
- Compartment containers are no longer incorrectly cast to P&D Shelf containers in some edge cases in the SIMPL SDK, causing several issues [#8123]

## 🤖 Firmware updates
?????

## 🧪 Development improvements
- Various data improvements in the Puls ecosystem [#7890] [#6641]
- Auto-clear can now be configured through various Kafka topics [#8063]
- Bot log ingestion pre-work [#7546]
- Additional Puls analytics data ingestion [#8026] [#8066] [#8044] [#8110]
- Pre-work for future improvements to traffic control, detour logic, robot task replanning and integration with safety zone [#7431]
- Pre-work for future safety zone loading from CAD import [#7986] [#7555]
- Tons of pre-work for future authentication and support ticket features in Flo and Puls [#6531] [#6532] [#6569] [#6571] [#6574] [#6575] [#6577] [#6593] [#6594] [#6598] [#6668] [#6692] [#6716] [#6722] [#6723] [#6724] [#6811] [#6990] [#7652] [#6533] [#7917] [#8104] [#7891]
- Pre-work for being able to paint workstations in the Flo Layout screen [#7298]
- IOCS messaging enhancements [#7996] [#8079]
- Some SIMPL SDK exceptions are no longer swallowed [#7823] [#7841]
- WDS now rejects `workstation-demand.upsert` messages if the two `destinationWorkstationLabel` fields do not match [#7253]
- GAS now publishes `ant.dismiss.rejected` Kafka messages when consuming `ant.dismiss` messages for unknown workstations
- Updated `workstation-demand.upsert` validation logic for DPS stations [#7278]
- Waltham layout bug fixes [#6763]

## 🚀 Deployment notes
- **New robot firmware?**: YES
- **New Flo APK?**: v4.5.23
- **New backend services**: MOM, TOM
- **Updated backend services**: ACAR, ADAS, AVS, CTB, CTS, CVS, DPS, GAS, IMS, IOCS, ITS, POP, PUT, RAS, RES, RQS, RVS, SASG, SOS, WDS
- **Database migrations**: NONE
- **Downtime requirements**: 30 minutes of full system downtime
