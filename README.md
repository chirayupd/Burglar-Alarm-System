# Simple Burglar-Alarm-System

## Problem Statement:
Design a simple burglar alarm system that monitors the status of windows/doors. When an unauthorized person opens the windows/doors, the system should sound alarm and display the number of opened windows/door on a seven-segment display.

## Solution 
A simple burglar alarm system can be designed using an 8051 microcontroller to demonstrate the use of I/O ports. It is assumed that the authorized person will deactivate the system before opening the windows/doors. 

The four switches are connected to port pins P2.0 to P2.3. Each switch is connected to a window or a door; the switches are normally closed and will be open when the corresponding window or door is opened (illegally). The wiring of these switches should have buffers connected with them for longer distance. The buffers are not shown for simplicity. In normal condition (window/door closed), the logic level at port pins P2.0 to P2.3 is ‘low’. When any one of these switches (window/door) is opened, the corresponding logic level at the port pin will be ‘high’ (because the port pins are pulled high by internal weak pull-up resistors).

The system output consists of a seven-segment display and a buzzer. The common cathode seven-segment display is connected with Port 3 pins with segment ‘a’ connected with P3.0 and segment ‘h’ connected with P3.7. The number of opened windows/doors will be displayed on a seven-segment display. The buzzer is connected with Pin P1.0 through buffer. The buzzer will be made ON to sound the alarm when any of the windows/doors is opened.

## Program Development
The program will continuously monitor Port 2. After reading Port 2 pin status, the upper four bits are masked because they are not used in the system. The masked result is compared with ‘0’. If it is ‘0’, it indicates that all the switches are closed; therefore, no action should be taken and the program should continue monitoring Port 2. If the result after masking is not ‘0’, it indicates that one of the windows/doors is open, the buzzer should be made ON first, and the window/door number should be displayed on the seven-segment display. This can be done by iteratively rotating the result of masking through carry flag until carry flag is 1. The counter can be incremented in each iteration to determine opened window/door number. Once it is determined, the corresponding seven-segment code is sent to the seven-segment module through Port 3. To simplify the program, only one window/door is displayed. In the case of multiple opened windows/doors, the program may be modified to display the corresponding numbers one by one. The assembly-language program for the burglar alarm system is given below.
