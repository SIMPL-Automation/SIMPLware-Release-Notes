# Upcoming Release

There's a new release that will be ready soon! These release notes are **incomplete** and **subject to change**.

# v3.2.1 - PIN it to win it
<div class=h1Subtitle>
2026.11.20
</div>

## ✨ Shiny new stuff
### 🔑 Sign in to Flo without a Microsoft account [#9220] [#9331]
Sites can now add **Flo users with no Microsoft account**!

![](_media/screenshots/3.2.1/NewSignInScreen.png)

- **Flo admins** can create, update, disable and reset the PIN for local users [#9222]
- Local users sign in to Flo with a **username and PIN**
  - Local users are given a **temporary PIN** that must be changed at **first sign-in** [#9223] [#9225]
- Sign-in details are **encrypted end to end**, so no password, PIN or token travels in the clear [#8396] [#9221] [#9225]

### 💾 Redis resilience [#8779]
Site data can now be **restored** after **full data loss**!

- The system takes **nightly snapshots** of its live data and can be **restored** from any of them [#9093] [#9094] [#9095] [#9096]
- **Inventory state** can be rebuilt from Puls events *(In Dev)* [#9097]
- A **disaster recovery runbook** and **restore drills** keep the team ready *(In Dev)* [#9099] [#9100] [#9101]

## ⏫ Level-ups
### ⚡ Snappier SIMPLware [#9152]
The system **visibility layer** that feeds Flo now runs on **its own Redis database**, taking load off the **main Redis** so the **whole system** lags less!

### 🚨 Problems caught before you notice *(In Dev)* [#8994]
The team now gets **alerts** the moment a **site's servers** run into trouble, with **dashboards** and **runbooks** to fix it fast! [#9159] [#9160] [#9161] [#9162] [#9163] [#9164] [#9165] [#9166] [#9167] [#9168]

### 🔄 Rotate totes in place with Flo teleport [#9112]
Teleport a tote to **its own spot** in Flo to **rotate it in place**!

## 🪲 Bug fixes
- Flo screens no longer stall for a moment every few minutes on busy sites [#9257]
- Signing in to Flo with Microsoft for the first time no longer times out after clearing the cache [#9332]
- Marking a tunnel accessible in Flo now takes effect right away instead of timing out after about two minutes *(In Dev)* [#9297] [#9341]
- After moving a Mantis to a DM code in Flo, more moves from the Robot Detail screen go through without leaving and reopening it *(In Dev)* [#9348]
- Blocked totes and shelves in Flo show "Blocked by" again, and a manual Mantis extract asks to remove the blocking tote first *(In Dev)* [#9343] [#9347]
- Container search in Flo now shows only the container you searched for, in number order *(In Dev)* [#9340]
- Workstation cards on the Workstations screen now show how full each workstation is, use the same red icons as the Workstation Detail screen, and open into it smoothly [#9195]
- The Demand Detail screen now counts Unconstrained and Constrained by demand type like its other counts, and tapping the workstation name opens the Workstation Detail screen [#9195] [#9194]
- Totes teleported to the orphanage now show the orphanage as their parent container on the Container Detail screen [#9263]
- Inaccessible tunnels now show on the shelf and tote screens with the tunnel's name instead of the shelf's [#9288]
- Containers on the Flo teleport bottom sheet now load every time without restarting Flo [#9264]
- Buttons on Flo bottom sheets, like the Containers screen filter buttons, are no longer hidden behind the Android navigation bar [#9291]
- Opening a container or tote's Detail screen in Flo now double-checks it right away *(In Dev)* [#9227]
- A Mantis is no longer reported as finishing a task it never finished, which left totes in the P&D while Flo showed them on the robot [#9299] [#9300]

## 💽 Firmware updates
No firmware updates required! ✅

## 🧪 Development improvements
- Groundwork for support tickets from local Flo users, so they reach support with the user's name once support tickets roll out [#9226]
- Services now fail in about 20 seconds with an honest log line when Redis is down, instead of 42 to 84 seconds [#9234]

## 🚧 Known issues
- Flo's Extract on the Robot Detail screen accepts a shelf location instead of a tote ID, and the robot then pulls out the shelf itself [#8866]
- Robots can sometimes stay offline after a short 4G drop until they're power cycled [#8313] [#8199] [#8411]
- Ants can sometimes form 4-way gridlocks [#8109]
- After converting multi-compartment totes to 1-compartment, empty 1-compartment totes often aren't brought to decant workstations [#8667]
- After RVS starts, some Mantis robots can appear without bay assignments until statuses catch up [#8599]
- CTS sometimes takes a long time to update container tags [#6576]
- An Ant's battery level can jump up or down when it connects to or leaves a charger [#8383]
- Workstations sometimes show as Off on the Flo Workstation and Workstation Detail screens when Tote Induction is enabled [#7779]
- Ants never show in "Moving" state [#7294]
- The on-screen keyboard cannot be used during Flo Tote Induction [#7907]
- Pressing Escape on the Flo Tote Induction screen does not return to the Workstation Detail screen when the tote label field has focus [#8342]
- On the Flo Containers screen, when lots of filters are selected, there is no room on smaller screens for the tote cards [#7851]
- Old robot logs aren't always cleaned up, so a robot's SD card can fill and stop saving new logs [#8995]

## 🚀 Deployment notes
- **New robot firmware?** NO
- **New Flo APK?** TBD
- **New backend services:** NONE
- **Updated backend services:** AVS, CVS, IMS, LVS, RMS, RVS, SSS, SVS, TOM, USA
- **Database migrations:** USA marks all existing users as Microsoft users at startup (runs automatically, safe to rerun) [#9222]
- **Helm configuration changes:**
  - Each site needs its own login key pair and sign-in settings for USA and SSS [#9224]
  - New nightly Redis backup CronJob; the Blob Storage IP whitelist must allow the cluster [#8779] [#9093] [#9094]
  - Deploy the new redis-ui chart first, then set the UI_REDIS_* and replica settings [#9205]
  - On-site Flo access works now over HTTPS; no more need to use port-forwarding when on-site [#9158]
- **Downtime requirements:** 2 hours full system downtime
