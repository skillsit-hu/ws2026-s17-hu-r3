# Module B - Lucky Suds

## Overview

Sudsy has decided to introduce a new promotional application: **Lucky Suds**.
This is a separate **mini-site** where laundromat users spin a virtual washing machine every 24 hours to win valuable discounts on their next wash.

## Requirements

- The solution must be implemented using **HTML, CSS, and vanilla JavaScript**. No JavaScript frameworks can be used.
- The solution must be optimized for **mobile** devices.
- Follow the designs provided in the `assets` folder as closely as possible.
- Implement animations and transitions as shown in the **videos** provided.

## Assets

- Fonts and the Sudsy logo are provided in the [`/assets/module-b/fonts`](./assets/module-b/fonts/) and [`/assets/module-b/images`](./assets/module-b/images/) folders.
- Design files are provided in the [`/assets/module-b/screens`](./assets/module-b/screens/) folder.
- Video files demonstrating the animations are provided in the [`/assets/module-b/screens`](./assets/module-b/screens/) folder.
- The prizes are provided in the [`/assets/module-b/prizes.json`](./assets/module-b/prizes.json) file.

## Screens

### 1. Welcome Screen

The welcome screen displays the "Lucky Suds" logo, a "Start!" button, and a Sudsy logo. The "Lucky Suds" logo should appear in with an **animation** as shown in `welcome-screen.mp4`. After the "Lucky Suds" logo appears, the Sudsy logo should **also appear with an animation**.

Clicking the "Start!" button should take the user to either the spin screen or the prize screen. If the user has already spun in the last 24 hours, they should be taken to the prize screen. If the user has not spun in the last 24 hours, they should be taken to the spin screen.

### 2. Spin Screen

The spin screen displays **a washing machine with a spin wheel inside.** Use **HTML and CSS** to create the washing machine and the spin wheel. The machine has a display that shows "READY" when entering the screen. The display has a **glowing text effect**. The spin wheel has 12 sectors, with alternating colors. There is a red indicator at the top of the spin wheel.

Yellow sectors indicate a win, while the gray sectors indicate a loss.

Clicking the "SPIN" button **starts the spinning animation**. The spin wheel should spin for about 5 seconds and go through several spins before stopping on a random spin. The spin wheel speed should increase gradually as it starts and then decrease before stopping.
While spinning, the display should show "SPIN", the "SPIN" button should be disabled, and the washing machine should make a vibration animation, as shown in `spin-screen.mp4`.

**While spinning, mobile devices should vibrate in a pattern that simulates the vibration of the washing machine.** The exact pattern is not defined.

After stopping, if the red indicator is on a yellow sector, the user has won a prize. If the red indicator is on a gray sector, the user has lost. The display on the washing machine should show "WIN!" or "LOSE" accordingly after the spin stops.
If the user has won, the "WIN!" message should be blinking.

After a few seconds, the screen should **transition to the next screen**.

### 3. Prize Screen

The prize screen displays the prize won by the user. **The prize is a discount on their next wash.** If the user has lost, the screen should not display a prize, but instead show a message saying "Better luck next time!".

If the user wins, the message "You win!" is displayed, and a random prize is selected from a list of prizes. The available prizes are listed in the `assets/prizes.json` file.

The prize screen should display the prize name, a description, and a coupon code. The coupon code should be a random 6-character alphanumeric string.
The coupon code field should contain a "Copy" button that allows the user to copy the coupon code to their clipboard.

Below the prize information should be a **countdown timer** indicating when the user can spin again. Each spin is available every 24 hours, therefore the countdown should start from 24 hours after a spin and count down to 0. The countdown should be displayed in the format "HH:MM:SS", and should update continuously.

If more than 24 hours have passed since the last spin, the countdown should be hidden with a **"Spin again!" button displayed instead**. Clicking the "Spin again!" button should take the user back to the spin screen.

The "Lucky Suds" logo should be displayed at the top of the screen, animated the same way as in the welcome screen.

## Persistence

The 24-hour spin limit and the countdown should work as expected, **even if the user closes the browser or refreshes the page**. The last prize and the coupon code should also be persistent across sessions.
If the user has already spun in the last 24 hours, clicking the "Start!" button should take them to the prize screen, and the prize won, if any, should be displayed. If the user has lost the last time, the message "Better luck next time!" should be displayed instead.
