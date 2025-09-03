# Maze Game (VGA, VHDL)

\[
\textbf{A Hardware Maze Game implemented in VHDL with VGA Output}
\]

---

## \section*{Abstract}
This project implements a simple maze game entirely in **VHDL**.  
The system outputs graphics to a VGA monitor at \(640 \times 480 \, @ \, 60\,Hz\).  
A player controls a ball through the maze to reach the goal before the timer expires.  

\[
\text{Demo: } \href{https://drive.google.com/file/d/1gxoyXRhgmTETSwnpEEDtXQtIgmuytdFo/view?usp=sharing}{\text{Watch Video}}
\]

---

## \section*{System Overview}
- **VGA Synchronization**: Generates HSYNC, VSYNC, and pixel coordinates.  
- **Maze ROM**: Stores the wall layout of the maze.  
- **Ball Module**: Updates position from user input and checks for collisions.  
- **Game Controller FSM**: Handles \(\{Idle \rightarrow Playing \rightarrow Win/Lose\}\).  
- **Display Logic**: Renders maze, ball, goal, and background.  
- **Timer**: Countdown with seven-segment display output.  

---

## \section*{Architecture}
\[
\begin{array}{ll}
\texttt{VGA\_SYNC.vhd} & \text{Generates sync pulses and coordinates} \\
\texttt{mazeROM.vhd} & \text{ROM-based maze structure} \\
\texttt{ball.vhd} & \text{Sprite control + collision detection} \\
\texttt{gameController.vhd} & \text{Finite state machine (FSM)} \\
\texttt{gameDisplay.vhd} & \text{Color generation logic} \\
\texttt{timer.vhd, sevseg.vhd} & \text{Timer + seven-segment display} \\
\texttt{mazeGameTop.bdf} & \text{Top-level integration} \\
\texttt{VGAPracticePinAssignments.qsf} & \text{Quartus pin constraints} \\
\end{array}
\]

---

## \section*{Controls}
- \( \uparrow, \downarrow, \leftarrow, \rightarrow \): Move the ball  
- **Reset Button**: Restart the game  

\[
\text{Note: Pin mapping depends on your FPGA board; see QSF file.}
\]

---

## \section*{Build Instructions}
1. Open Quartus and create a project.  
2. Add all `.vhd` files and `mazeGameTop.bdf`.  
3. Apply `VGAPracticePinAssignments.qsf`.  
4. Compile the design.  
5. Program the FPGA and connect a VGA monitor.  

---

## \section*{Customization}
- **Maze Layout**: Edit `mazeROM.vhd`.  
- **Difficulty**: Adjust timer constants or ball step size.  
- **Graphics**: Modify color assignments in `gameDisplay.vhd`.  

---

## \section*{Conclusion}
This project demonstrates how a classic maze game can be implemented  
using pure hardware description logic.  
The design is modular, customizable, and provides a foundation for  
more advanced FPGA-based gaming systems.  

---

## \section*{Credits}
Forked from \texttt{BouvinGithub/maze-game}.  
Maintained by \href{https://github.com/hoangtranviet07}{hoangtranviet07}.
