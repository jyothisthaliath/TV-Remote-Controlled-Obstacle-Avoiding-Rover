# TV-Remote Controlled Rover with Obstacle Detection

A B.Tech mini project from 2010–2011 that implements an infrared TV-remote controlled two-wheel rover with onboard obstacle detection using an ATmega328P microcontroller, TSOP1738 IR receiver, L293D motor driver, and IR proximity sensors.

<p align="center">
  <img src="image/Concept%20Sketch.png" alt="Concept Sketch" width="700">
</p>

## Overview

This project was developed as part of the Bachelor of Technology program in Electronics & Communication Engineering at the Federal Institute of Science and Technology (FISAT), affiliated with Mahatma Gandhi University. The rover can be driven using a standard TV remote, while onboard obstacle sensors help prevent collisions by disabling unsafe movement directions when an obstruction is detected.

## Team

- Johaan J.J.
- Jyothis George Thaliath
- Sarath N.S.
- Shyamprasad M.P.

## Project Objective

The goal of this project was to build a small rover that could:

- Receive and decode IR commands from a TV remote using a TSOP module.
- Translate those commands into motor movements through a microcontroller and H-bridge driver.
- Detect nearby obstacles using IR LED and photodiode-based proximity sensors.
- Prevent collisions by disabling movement in blocked directions.

## Features

- TV remote based motion control.
- Forward, backward, left, and right movement.
- Idle state when the remote button is released.
- Front and side obstacle detection.
- Variable sensor sensitivity for obstacle threshold tuning.
- ATmega328P-based embedded control.
- L293D motor driver based dual DC motor drive.

## Hardware Used

| Component | Purpose |
|---------|---------|
| ATmega328P | Main microcontroller |
| TSOP1738 | IR receiver for TV remote commands |
| L293D | H-bridge motor driver |
| Geared DC motors | Rover movement |
| IR LED + photodiodes | Obstacle sensing |
| LM7805 | 5V voltage regulation |

## How It Works

The rover receives coded infrared signals from a standard TV remote through the TSOP1738 receiver module. These signals are decoded by the ATmega328P, which maps specific remote buttons to movement commands and drives the motors through the L293D H-bridge.

The rover also carries three obstacle sensors placed at the front and sides, built using IR LEDs and photodiodes. When an obstacle reflects IR light back to a sensor, the microcontroller detects the increase and disables the corresponding movement command to avoid collisions.

The implementation also handles repeat codes in the NEC infrared protocol, allowing continuous motion while a button remains pressed instead of requiring repeated taps.

## System Design

### Block Diagram

<p align="center">
  <img src="image/BLOCK%20DIAGRAM.jpg" alt="Block Diagram" width="300">
</p>

### Circuit Diagram

<p align="center">
  <img src="image/CIRCUIT%20DIAGRAM.png" alt="Circuit Diagram" width="700">
</p>

## Software

The project was developed using the Arduino environment available at the time, with code written in Arduino/Wiring-style C/C++. The IR receiver logic was implemented using the IRremote library, and the rover control logic was written around manual movement, sensor checks, and mode/power control.

### Software Flowchart

<p align="center">
  <img src="image/Flowchart.png" alt="Software Flowchart" width="500">
</p>

## Repository Structure

```text
tv-remote-rover/
├── README.md
├── LICENSE
├── code/
│   └── rover.ino
├── docs/
│   ├── Project-Report-Softcopy-Group-4-ECEB-S6.pdf
│   ├── images/
│   │   ├── block-diagram.png
│   │   ├── circuit-diagram.png
│   │   ├── flowchart.png
│   │   └── pcb-layout.png
└── media/
    └── demo.mp4
```

## Code Summary

The Arduino sketch:

- Reads IR commands from the TSOP receiver.
- Maps known hex codes to directional actions.
- Controls two DC motors through four output pins.
- Samples analog sensor values for front, left, and right detection.
- Prevents unsafe forward/left/right movement when an obstacle is sensed.
- Uses NEC repeat frames to maintain continuous motion while a remote key is held.

## Circuit and Design

The circuit is centered around the ATmega328P, with a 16 MHz crystal, TSOP1738 IR module, L293D motor driver, LM7805 regulator, and three IR sensing channels. The report also includes a block diagram, full circuit diagram, PCB layout, and fabrication notes covering screen printing, etching, drilling, mounting, and soldering.

### PCB Layout and Component Layout

<p align="center">
  <img src="image/PCB%20Layout%20and%20Component%20Layout.png" alt="PCB Layout and Component Layout" width="700">
</p>

## Key Components

### ATmega328P

<p align="center">
  <img src="image/Pinout%20diagram%20of%20Atmel%20ATMEGA%20328P.jpg" alt="Pinout diagram of Atmel ATMEGA 328P" width="500">
</p>

### L293D Motor Driver

<p align="center">
  <img src="image/Pinout%20diagram%20of%20IC%20L293D.jpg" alt="Pinout diagram of IC L293D" width="500">
</p>

### LM7805 Voltage Regulator

<p align="center">
  <img src="image/Pinout%20diagram%20of%20LM%207805.jpg" alt="Pinout diagram of LM 7805" width="400">
</p>

### TSOP1738 IR Receiver

<p align="center">
  <img src="image/Pinout%20diagram%20of%20TSOP%201738.jpg" alt="Pinout diagram of TSOP 1738" width="450">
</p>

## Results

The rover was first tested on a prototype board and then migrated to a PCB after validation of the individual stages. The final system responded reliably to the remote control with an estimated operating range of about 10 meters, and the obstacle sensors supported adjustable sensitivity in the range of approximately 4 cm to 20 cm.

One practical issue observed during the PCB version was increased power demand, which led to motor slowdown and the need for an external DC power source instead of batteries. Even so, the reduced speed improved obstacle detection response time and helped collision avoidance.

## Future Scope

The original project identified a future extension in which the rover could support a fully automated mode without continuous human intervention. Since the hardware already included obstacle detection, this enhancement would mainly require software changes and could be extended further using other communication methods such as Bluetooth or GSM.

## Project Report

The original mini project report is included in this repository for reference:

`docs/Project-Report-Softcopy-Group-4-ECEB-S6.pdf`

## Notes

This repository is being published as an archival and portfolio showcase of an undergraduate mini project completed in 2011. Some parts of the implementation, toolchain, and code style reflect the Arduino and embedded development practices of that period.

## Acknowledgement

This project was carried out at the Department of Electronics & Communication Engineering, Federal Institute of Science and Technology (FISAT), under the guidance and support acknowledged in the original report.
