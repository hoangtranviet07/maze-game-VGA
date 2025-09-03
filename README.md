Maze Game (VGA, VHDL)

This project implements a maze game in VHDL with VGA output. The game displays a maze on a 640×480 VGA screen. The player controls a ball and must reach the goal before the timer runs out.

Demo video: Watch here

Features

VGA controller generating HSYNC, VSYNC, and pixel coordinates.

Maze layout stored in ROM (mazeROM.vhd).

Player ball with collision detection against walls (ball.vhd).

Finite State Machine for game states: idle, playing, win, timeout (gameController.vhd).

Rendering logic for maze, ball, goal, and background (gameDisplay.vhd).

Countdown timer displayed on seven-segment LEDs (timer.vhd, sevseg.vhd).

Top-level schematic integration (mazeGameTop.bdf).

Pin assignment file for Quartus projects (VGAPracticePinAssignments.qsf).

How It Works

The VGA module drives a 640×480 @ 60 Hz display using a 25 MHz clock.

The ball position updates based on player input.

The system checks for collisions with maze walls.

If the goal is reached before time runs out, the player wins.

If the timer expires, the game ends.

Controls

Switches or keys for movement: up, down, left, right.

Reset button to restart the game.

Note: Button and switch mapping depends on your FPGA board. See the provided .qsf file for pin assignments.

File Overview

VGA_SYNC.vhd – VGA synchronization module.

gameDisplay.vhd – Rendering and pixel color logic.

gameController.vhd – Game state machine.

ball.vhd – Ball movement and collision logic.

mazeROM.vhd – Maze structure stored in ROM.

timer.vhd, timerDisplay.vhd, sevseg.vhd – Timer and display logic.

mazeGameTop.bdf – Top-level design.

VGAPracticePinAssignments.qsf – Pin assignment file.

Build Instructions

Open Quartus and create a new project.

Add all .vhd files and the top-level schematic (mazeGameTop.bdf).

Apply the pin assignment file (VGAPracticePinAssignments.qsf).

Compile the design.

Program the FPGA.

Connect a VGA monitor and play the game.

Customization

Change the maze layout by editing mazeROM.vhd.

Adjust timer values or ball speed to modify difficulty.

Update gameDisplay.vhd to change colors or graphics.

Re-map controls by editing the top-level design and .qsf file.
