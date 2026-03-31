# Scope

## In scope
- SIMPL UIs: Flo and Puls
- SIMPL Kotlin and Python backend services
- SIMPL Kotlin, Python, and Flutter SDKs
- Robot firmware

## Out of scope
- Software infrastructure
- Robot mechanics
- Layout and physical infrastructure

> **NOTE**: SIMPL ticket numbers are denoted like this: **[#<\<ticket-number>\>]**

# v2.1.0 - Revenge of the backend
<div class=h2Subtitle>
2026.03.27
</div>

## ✨ Shiny new stuff
### ⤵️ New WorkstationDemand API [#5873]
Get exactly what you need at your workstation with the new `WorkstationDemand` API!

- `WorkstationDemandUpsert` messages are produced to communicate the **entirety** of Workstation demand
- Each `WorkstationDemandUpsert` message contains an **exhaustive** set of `WorkstationDemands` for the specified Workstation
- Any previously existing `WorkstationDemands` for the specified workstation that are not included in the new `WorkstationDemandUpsert` message will be considered **removed** and will **no longer be active**
- **Multiple types** of `WorkstationDemands` can be included in a single `WorkstationDemandUpsert` message (e.g., `ProductPack` demand and `EmptyContainer` demand).
- See the **full API spec doc** for more details

## ⏫ Level-ups
### 🕵 Full Audit (backend only) [#5863]
SIMPLware now has a new Mantis process called **Full Audit** which will audit all totes in a **Bay**!

- This is a **backend-only MVP implementation** which can be kicked off using a **Kafka message**
- Lots of improvements coming soon, including a very nice **Flo integration** that will keep you up to date and informed on the exact **status and findings** of audits in **real time**!

### 💾 Improved initial container download time in Flo [#6231]
Flo now downloads containers **faster** from the backend when starting Flo with a **fresh cache**!

### ↔️ Conditional extract and deposit buttons in Flo [#5363]
Manual extract and deposit buttons in Flo only show **when appropriate** based on whether the robot has a **tote onboard**.

## 🪲 Bug fixes
- Mantis manual moves to DM codes work now [#6362]
- Flo now shows full DM code offsets for Mantises in the Scanner section of the Robot Detail screen [#6363]
- Homing code collect now starts properly [#5917]
- Flo no longer shows totes as blocked after the blocking tote is teleported to the Orphange [#6360]
- Typing capital `T` into the Orphanage teleport reason field on Flo Web no longer clears the form [#6361]

## 🤖 Firmware updates
✅ No firmware updates required!

## 🧪 Development improvements
- Backend services can now take advantage of the new `inventory.upsert` Kafka API to update inventory in Redis [#6461]
- Added the ability to do basic testing of Mantis DM code moves in QA environments [#6373]
- Modernization of the GAS and CTB services; converted to the SIMPL SDK [#5875]
- Additional ITS test cases for Puls [#6205]

## 🚧 Known issues
- The new Full Audit process often leaves totes in Shelf 1 positions with no totes behind them in Shelf 2 positions [#6492]

## 🚀 Deployment notes
- **New Flo APK?**: YES
- **New backend services**: WDS
- **Updated backend services**: CTB, CVS, GAS, IMS, ITS, URS
- **Database migrations**: NONE
- **Downtime requirements**: 30 minutes of full system downtime

# v2.0.3 - Flo and auto-clear bug fixes
<div class=h2Subtitle>
2026.03.12
</div>

## ✨ Shiny new stuff
〰️ Sorry, just the shiny old stuff for now.

## ⏫ Level-ups
🚢 Steady as she goes.

## 🪲 Bug fixes
- Flo Web is no longer jittery when it's processing messages like Robot and Container updates [#6254]
- Flo now allows you to teleport Totes to Storage locations that have Aisle and Side labels that are prefixed like `S1-A1-S1` [#6253]
- SIMPLware will no longer automatically add any default Auto Clear rules [#6272]

## 🤖 Firmware updates
✅ No firmware updates required!

## 🧪 Development improvements
🙈 Nothing to see here.

## 🚧 Known issues
👻 Ghost town.

## 🚀 Deployment notes
- No downtime is required for this release, but Flo Web instances accessed through port-forwarding will disconnect during the deployment.
- This release includes a new Flo APK

# v2.0.1 - Find Containers; massacre bugs
<div class=h2Subtitle>
2026.03.06
</div>

## ✨ Shiny new stuff
### 📦 New Containers screen in Flo! [#4986]
Finding and researching Containers just got a lot easier! Tap the **new filter icon** in the app bar on the **Containers screen** to search Containers any way you please!

![Containers screen](/Assets/Images/SIMPLwareReleases/2.0.1/ContainersScreenDesktop.png)

- After selecting some filters, click the **"Apply filters"** button to see all Containers in the system that **match your criteria**
- Easily find all **disabled** or **inaccessible** Containers, all Containers of a particular **type**, **tag**, **location**; the possibilities are endless!
- Adaptable cards make this screen even better to use on **desktop**!
- Flo no longer downloads **all Containers** every time you refresh it; it will only download **Containers that have changed** since it's last download

### ‼️ Inaccessible Tunnels alert [#6206]
Flo will now **alert you** (with a new tone) whenever a Robot marks a Tunnel as **inaccessible**.

![Inaccessible alert](/Assets/Images/SIMPLwareReleases/2.0.1/InaccessibleAlert.png)

- When **Robots** fail to complete extract or deposit tasks at a Tunnel, they **mark the Tunnel as inaccessible** and move on to other tasks until a **human marks the Tunnel as accessible** again
- Tap the **red Tunnel alert icon** to jump to the Containers screen, filtered on **inaccessible Tunnels**
- After **resolving issues** at the Tunnel, easily **mark the Tunnel as accessible** again by tapping the **Tunnel card**, then tapping the **Accessible tile**

## ⏫ Level-ups

### 🕰️ Improved "process by time" in the Area Demand API [#6203]
The Area Demand API now accepts "process by time" in many different formats.

## 🪲 Bug fixes
- Robot initialization from Flo is working again [#6202]
- Commands issued from Flo, like manual moves, Robot clearing, and initialization aren't super slow anymore [#6150]
- Enabled and Inaccessible states in Flo are now accurate for children Containers when "Propagate to children" is used [#6129]
- Making Tunnels accessible from Flo will now also automatically make the children Shelves accessible [#6211]
- Flo will now auto-reconnect to the EMQX server when it loses connection. This feature was inadvertently removed in release 2.0.0 [#6222]
- The full text of notifications is now visible on the Notification Detail screen in Flo [#6224]
- Robot counts no longer overlap the Robot filter icon on the Layout screen on smaller Flo devices [#6225]
- The Android status bar no longer overlaps icons on the Robot Cards side-sheet in Flo [#6227]

## 🤖 Firmware updates
✅ No firmware updates required!

## 🧪 Development improvements
- Improved QA test cases for one of our digital clones [#6220]
- NVS MQTT client ID now uses the Kubernetes pod ID for smoother upgrades [#6192]

## 🚧 Known issues
- This release is incompatible with previous releases of Flo due to the change in how we handle Container cache. Please clear your Flo browser site data or Android data before launching the new version of Flo.

# v2.0.0 - New features galore!
<div class=h2Subtitle>
2026.02.28
</div>

## ✨ Shiny new stuff
### 🌎 New and improved Layout screen in Flo! [#5367]
The **Robots screen** in Flo has been **deprecated** and merged into the new and improved **Layout screen**!

- When in **mobile view**, tap the **Robots button** to display the **Robot status cards** (previously on the Robots screen)
- On **desktop**, the Robot cards are **always visible** alongside the Layout view for quick access!
- Tap the **compass button** multiple times to rotate the layout 90° with each tap
- The Layout screen is also much snappier thanks to many new optimizations!

### 🦺 Stay safe, with Safety Zones! [#4911]
You can now create and modify 3D spaces in your layout that you want to designate as "**Safety Zones**". Safety Zones can be **locked** to ensure Robots in the Area **can not move** and to prohibit any other Robots from **entering** the locked zone.

- From the Flo **Layout screen**, tap the **shield button** to toggle the **Safety Zones view** and select one or more zones to **lock** or **unlock**
  - **SAFE (locked)** zones are **GREEN**
  - **UNSAFE (unlocked)** zones are **RED**
- When a zone is locked, any Robots trying to move **within**, or **into** the zone will be **blocked**; any Robots that receive new Robot tasks while in a locked Safety Zone will instantly **fail** those tasks
- When locking zones, you have the option to provide a **numeric pin** to prevent someone else from unlocking the zone inadvertently
  - When set, the pin is **required** to unlock the zone and allow Robots to move again
  - Pin locks persist beyond your individual Flo device and will be required to unlock the zone from **any device**
- In this initial release, the **Kafka UI** can be used to create and modify Safety Zones for initial setup, as well as to reset a lock pin in the event it is forgotten

### 🗺️ Introducing, the Areas screen [#1790]
A new **Areas screen** has been added to Flo to track the status of Areas and Workstations throughout the system.

- The Areas screen gives you an **overview of all Areas** in the system: what an Area is **requesting** (Area Demand), what's **on the way** (Area Transfers), and **how many Robots** are currently operating in that Area
- For Workstations, the Areas screen also lets you know if a Workstation is turned **on or off**
- Tap on an Area card to jump to the **Area Detail screen**. From here you can:
  - **Control Robots** in the Area (just like on the Layout screen)
  - See exactly which totes are **on the way** and where they are **currently located**
  - Drill down into all **child Containers** of the Area

### 📍 Position Ants quickly with Ant nodes in Flo! [#5367]
**Ant nodes** can now be seen in the **Layout view** and are colored according to their types!

- Zoom in to see the nodes, and tap a node to jump to the **Node Detail screen**
- From the Node Detail screen, you can see the **precise coordinates** of the node, it's default **orientation**, and **type properties**
- Tap the **Move Ant button** on the Node Detail screen to move the selected Ant to that node with the default orientation

### ⭕ Manage offline Robots through Flo [#4434]
Robots that are offline **no longer vanish** from Flo when the app is re-loaded, allowing you to see the **last known state** of the Robot

- When a Robot is offline but still **reserving space** in the layout, it will show on the Layout view in the position it is **still reserving**
  - To **remove** this reservation and **allow other Robots** to operate in that space, first, **move the bot to a safe location**, then use the **out-of-commission** button on the Robot Detail screen
  - When a Robot is out-of-commission and not reserving space in the layout, it will NOT show in the **Layout view**, but will still show in the list of **Robot cards**
- **Tote changes** for offline Robots are still updated **in real-time**, letting you know whether the SIMPLware inventory system believes a tote is on board the Robot

### 🚦 Ant travel optimizations [#4799] [#4921]
- **Ants with totes onboard** only charge when absolutely necessary
  - SIMPLware now directs Ants to **deposit** their totes first **before charging** except in emergency charging situations
- Ants will now **avoid Mantises** that are **faulted** or in **manual mode** whenever possible
  - This greatly reduces the chances of large traffic jams

### ⌨️ Flo keyboard shortcuts [#5367]
Flo has some new **keyboard shortcuts** to make desktop mode even faster with more to come in future releases!

  - [**Home**]: Return to the Layout screen
  - [**Esc**]: Close active dialog or sheet; Navigate back from a detail screen
  - [**Shift**+**Enter**] on the Layout screen: Show Robot cards when hidden
  - Quick form navigation
    - [**Tab**] / [**Shift**+**Tab**]: Switch focus within a section
    - [**Space**] / [**Enter**]: Select focused item
    - [**T**]: Toggle all selections in a section
    - [**Up**] / [**Down**]: Move focus to a different section
    - \[**Cmd/Ctrl**+**Enter**]: Submit

### 🔘 Other new features
  - Improved **Ant task planning time**, significantly reducing delays between movements [#4997]
  - If a tote demanded by a Workstation becomes inaccessible, SIMPLware will now **select a different tote** to fulfill that demand when possible [#5007]
  - You can now manually deposit totes to **P&D locations** using Flo [#5361]


## ⏫ Level-ups
🚢 Steady as she goes.

## 🪲 Bug fixes
- Flo now shows the correct Enabled and Accessible states of Containers in most cases. See [Known issues](#known-issues) below. [#5301]
- Flo out-of-commission feature now correctly clears Mantis state reservations [#5973]
- No longer delivering more inventory than required to GTP Workstations during picking operations [#5295]
- Resolved an edge case where SIMPLware would sometimes send multiple Ants to the same charger [#5591]
- Flo now reliably shows the blocked state of Shelves and totes [#4705]
- Fixed a bug in Flo where it would sometimes report "Unknown Container" during manual extract of a valid tote [#4919]
- Flo no longer has visual and audio alerts for auto-cleared Robot task failures [#5025]

## 🤖 Firmware updates
✅ No firmware updates required!

## 🧪 Development improvements
- RMS and LM automatically create Kafka topics they need to listen to at startup if they don't exist in the broker [#5775]
- Improved command timing in simulated environments [#5615]
- Improved Container tagging performance by removing redundant tag operations [#5311]
- Modernization of the URS service; converted to the SIMPL SDK [#5385]
- Some pre-work for future "Mantis auto-localization when resting" feature [#4637]
- Major modernization refactor in Flo, including the creation of several Flutter libraries [#5367] [#5368] [#5371] [#5372] [#5373]

## 🚧 Known issues
- Enabled and Inaccessible states in Flo could be inaccurate until the app is reloaded for children Containers when "Propagate to children" is used to update Container tags on the parent Container [#6129]
- When Robots receive Robot tasks while in locked Safety Zones, they immediately fail the task, but the failure reason in Flo is not particularly helpful. Right now it will simply print the raw label of the locked Safety Zone it is in. [#6170]
- It takes up to 10 seconds for changes to Mantis Bay assignments to apply [#6150]
