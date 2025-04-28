# Module A – Speed test

- [Module A – Speed test](#module-a--speed-test)
  - [Overview](#overview)
  - [Project structure](#project-structure)
  - [Tasks](#tasks)
    - [A1: Image grayscale (Easy)](#a1-image-grayscale-easy)
    - [A2: Floating input label (Medium)](#a2-floating-input-label-medium)
    - [A3: 3D Rubik's Cube (Hard)](#a3-3d-rubiks-cube-hard)
    - [B1: Digital Clock (Easy)](#b1-digital-clock-easy)
    - [B2: Draggable Element (Medium)](#b2-draggable-element-medium)
    - [B3: Box Shadow Generator (Hard)](#b3-box-shadow-generator-hard)

---

## Overview

This module requires you to complete a series of independent tasks. The tasks are designed to test your knowledge of HTML, CSS, and JavaScript.

Tasks beginning with A require you to use HTML and CSS, not JavaScript.  
For tasks beginning with B, you can (and must) use JavaScript.

## Project structure

You can create your repository using the `vanilla-js-app` template. Then, create 6 folders for each task: `a1`, `a2`, etc. Inside these folders, place an `index.html` file where your solution should be. Please also place any media in the task's subfolder. When deployed, we should be able to access your solution on the `/a1`, `/a2`, etc. paths.

---

## Tasks

### A1: Image grayscale (Easy)

You are provided with a colored image. Display this image on the screen. When the user hovers the image, the image turns into grayscale with a transition. When the user's mouse leave the image, the image returns to it's original colored state.

You cannot edit the provided image with any editing software.

### A2: Floating input label (Medium)

Using only HTML and CSS, please create the following: Referring to the provided video example, create a Material UI-like floating label above the input field. Try to match the styles and colors as much as possible.

The label should float when the input field has focus or when the input field has any value.

- Blue: #2E57FA
- Border: #D3D3D3
- Placeholder: #838383

### A3: 3D Rubik's Cube (Hard)

Create a 3D Rubik's Cube using only HTML and CSS. The cube should be centered both vertically and horizontally on the screen. The cube should rotate constantly with animation, as seen in the video example.

The cube has the following sides:

- Top: **white**
- Bottom: **yellow**
- Front: **red**
- Back: **orange**
- Left: **green**
- Right: **blue**

### B1: Digital Clock (Easy)

Please create a simple JavaScript code that displays the user's current time. The clock should update every second. The clock should show the time in this format: HH:MM:SS. You are provided with a basic template.

### B2: Draggable Element (Medium)

You are provided with a basic HTML and CSS. There is already a box in the screen. When grabbing this box, the user can move the element around the screen. Releasing this element stops the dragging.

Please note, that the grabbing should be smooth and user-friendly, there should not be any flickering or jumping when the user starts to drag the element.

Please see the example video in the media files.

### B3: Box Shadow Generator (Hard)

Create a tool that allows users to generate a box shadow with the following parameters:

- **x offset**: -50px - 50px
- **y offset**: -50px - 50px
- **spread**: -50px - 50px
- **blur**: 0px - 100px
- **color**: color input, allows the users to pick any color

Every parameters can be adjusted with a range type input (Except for the color, which is a color input).

When changing the color, the colors of the range inputs should also change accordingly.

There is also a copy button. Clicking this button copies the generated box shadow to the user's clipboard. The generated box shadow is also shown next to the copy button.

The user should also see and feel the generated box shadow, by applying it to the container directly.

Please refer to the video example.
