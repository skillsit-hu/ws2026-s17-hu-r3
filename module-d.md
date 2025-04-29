# Module D - Frontend

In this module, your task is to develop a **mobile-friendly website** that customers can use to operate washing machines.  
The goal is for this site to work both as a **mobile Progressive Web App (PWA)** and as a **kiosk interface** at specific locations.

A fully functional **backend** is already provided for this module at `https://module-c-YYYY-solution.sudsy.com`, where `YYYY` is your PIN code.

> **Important:**  
> Use the provided backend only. **Do not use the backend you developed in Module C.**

All required media assets, icons, and text content are available in the [`assets/module-d/`](./assets/module-d/) directory.

---

- [Module D - Frontend](#module-d---frontend)
  - [1 General information](#1-general-information)
    - [1.1 Design](#11-design)
    - [1.2 Authentication](#12-authentication)
    - [1.3 Layout](#13-layout)
    - [1.4 Navigation](#14-navigation)
    - [1.5 PWA](#15-pwa)
  - [2. Pages](#2-pages)
    - [2.1 Login Page](#21-login-page)
  - [2.2 Registration Page](#22-registration-page)
  - [2.3 Index Page](#23-index-page)
    - [2.3.1 Machines Layout](#231-machines-layout)
    - [2.3.2 Machine status polling](#232-machine-status-polling)
    - [2.3.3 Interactivity](#233-interactivity)
  - [2.4 Machine Page](#24-machine-page)
    - [2.4.1 Machine start screen](#241-machine-start-screen)
    - [2.4.2 Machine dashboard](#242-machine-dashboard)
    - [2.5 Top-Up Page](#25-top-up-page)

---

## 1 General information

### 1.1 Design

You are responsible for designing the UI, aiming to match **Sudsy’s** brand identity in style and color scheme. A **style guide** is available at [`assets/module-d/style-guide.png`](./assets/module-d/style-guide.png), and you are free to use additional different shades of the provided colors.

[Wireframes](./assets/module-d/wireframes/) are also provided, which **must** be followed.

> **Note:** Your solution will be evaluated on an **iPhone 12 Pro (390 × 844)** screen. Make sure your design is optimized for this resolution.

A custom font is provided for your use as well.

### 1.2 Authentication

- **Protected pages:**  
  Only the **Login** and **Registration** pages are accessible without authentication. All other pages must redirect unauthenticated users to the Login page.
- **Login behavior:**

  - After successful login, store the authentication token **per browser tab** (not globally across all tabs), so after page reload, the user stays logged in.
  - Include the token in the `Authorization` header on all API requests:
    ```
    Authorization: Bearer <token>
    ```

- **Redirection rules:**
  - Logged-out users attempting to access protected pages → **redirect to Login**.
  - Logged-in users trying to access Login or Registration → **redirect to Index page**.

### 1.3 Layout

All pages _(except Login and Registration)_ must include a common layout with:

- The **"Sudsy"** title or logo (clickable, redirects to Index page)
- The logged-in user's **name** and **credit balance**
- A **Logout** button that logs the user out and redirects to Login

### 1.4 Navigation

The URL must reflect the current page to ensure that **refreshing the browser reloads the same view**.

### 1.5 PWA

The application must be installable as a PWA (Progressive Web App), providing a native-app-like experience.

## 2. Pages

### 2.1 Login Page

- Fields: **Email** and **Password**
- On submission:
  - Send credentials to the backend.
  - On success:
    - Store the token.
    - Redirect to the **Index page**.
  - On failure:
    - Display an error message.

## 2.2 Registration Page

- Fields: **Name**, **Email**, **Password**, **Password Confirmation**
- Before sending:
  - Ensure passwords match (otherwise show an error and prevent sending).
- On success:
  - Redirect to the Login page with the email **pre-filled**.
- On failure:
  - Display an error message.

## 2.3 Index Page

### 2.3.1 Machines Layout

- List all available machines.
- Use the provided `x` and `y` coordinates to dynamically **position** machines to match the real shop layout.
- Shop base size: `1200 × 1200`.
- Machine width: `180px`.
- The layout must **scale proportionally** to the width of the screen, maintaining its relative position (padding on the sides is allowed if it looks better in your design). This means that on an iPhone 12 screen, it will shrink to fit its width.

**Machine status colors:**

| Status      | Color  |
| :---------- | :----- |
| Idle        | Blue   |
| Operational | Red    |
| Paused      | Yellow |

> Machine icons with the correct colors are provided.

The inner circle of the running machine should rotate using a CSS animation.

Additionally, include location-specific information as shown in the wireframes _(hardcoded, as there is currently only one location)_.

### 2.3.2 Machine status polling

- Poll each machine’s status one-by-one using the backend API every 10 seconds.

### 2.3.3 Interactivity

- Machines that are **idle**, **running** (owned by the user), or **paused** (owned by the user) should be **clickable** and navigate to the Machine page.

## 2.4 Machine Page

Depending on the machine's state, display one of two variations:

- **Machine Start Screen** (if machine is available)
- **Machine Dashboard** (if machine is running)

> If the machine is running a different user's program, **redirect to the Index page**.

**Poll machine status every 10 seconds** while on this page. If machine status changes and becomes unavailable, **redirect back to the index page**.

### 2.4.1 Machine start screen

- Show available programs.
- Each program card:
  - Displays: **Program Name**, **Temperature**, **Spin Speed**, **Program Duration**.
  - Acts like a **radio button** (selected program highlighted).
  - The user may adjust **spin speed** and **temperature** in a program.
- "Start Machine" button is only enabled once a program is selected.
- On start attempt:
  - If failed:
    - If machine already started → redirect to Index page.
    - If insufficient credits → redirect to Top-Up page.
    - Otherwise → show an error toast.
  - If successful:
    - Subtract credits (by the backend).
    - Immediately update user balance in the header.
    - Switch to **Machine Dashboard** view.

### 2.4.2 Machine dashboard

- Display current program details: **Program Name**, **Temperature**, **Spin Speed**, **Remaining Time**.
- Allow user to:
  - **Pause**, **Resume**, or **Stop** the machine.
  - Update UI immediately, but still keep polling.
- Update **remaining time** client-side, every second.
- On completion (time reaches 0):
  - Send a **push notification** using the browser's API. _Prompt users to allow push notifications when they first access the application (after login or on first visit)._
  - Return to **Machine Start Screen**.
  - Allow user to start a new program or go back to Home.

Include a **Back to Home** button for convenience.

### 2.5 Top-Up Page

- Display an input field for entering the **amount**.
- Submit button sends the amount to the backend after confirmation.
- There is **no real payment** system (yet); assume instant success or error.
- On success:
  - Immediately update the user's credit balance in the header.
- On failure:
  - Display an error message.
