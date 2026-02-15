# Anti-lock Braking System (ABS) — Embedded & Simulation

A comprehensive project demonstrating **Anti-lock Braking System (ABS)** across embedded hardware (Arduino) and simulation environments (Simulink and MATLAB).

This repository includes:
✔ Arduino ABS implementation with motor control and Bluetooth  
✔ ABS vehicle Simulink model showing wheel/vehicle dynamics  
✔ ABS MATLAB script for Tata Sierra SUV demonstrating braking physics

---

## 🧠 About ABS

**Anti-lock Braking System (ABS)** is a safety system that prevents wheel lockup under hard braking, ensuring optimal tire–road friction and steering control.  
It dynamically modulates brake torque based on slip ratio — preventing skidding and reducing stopping distance. :contentReference[oaicite:0]{index=0}

---

## 📁 Repository Structure

Anti-lock_Braking_System/
├── ABS_Arduino_code/ # Arduino ABS with L293D & HC-05 Bluetooth
├── ABS_Simulink_Modelling/ # MATLAB/Simulink ABS model files
├── ABS_Tata_Sierra_SUV/ # MATLAB code for Tata Sierra braking case
└── README.md # Project overview (this file)

yaml
Copy code

---

## 🛠 1. Arduino ABS Module

**Folder:** `ABS_Arduino_code/`  
Contains embedded code for Arduino Uno (ATmega328P) to implement a simple ABS-like behavior using:

✔ HC-05 Bluetooth for user communication  
✔ L293D H-bridge motor driver  
✔ RPM sensor feedback for wheel speed

### 🔧 Features
- Reads wheel speed
- Applies brake torque via motor actuation
- Prevents wheel lock via simple control logic
- Bluetooth communication for debugging/racing apps

### 📋 How to Use
1. Upload code to Arduino Uno.
2. Connect HC-05 Bluetooth (RX/TX) and L293D motor driver.
3. Send commands via serial app to simulate braking.
4. Monitor wheel speed and torque status.

---

## 🧪 2. ABS Simulink Model

**Folder:** `ABS_Simulink_Modelling/`  
Contains a complete Simulink model of an ABS using vehicle dynamics and bang-bang slip control.

### 📌 Model Highlights
- Wheel and vehicle dynamics separated
- Slip calculation using:
slip = (v - ωR) / v

markdown
Copy code
where *v* is vehicle velocity and *ω* is wheel angular speed. :contentReference[oaicite:1]{index=1}
- Bang-bang controller toggles brake torque
- μ–slip lookup table represents tire friction

### 🎯 Outputs
- **Wheel speed** plot with ABS oscillations  
- **Vehicle speed** deceleration plot  
- **Stopping distance** integration plot  
- **Slip ratio** regulation curve

You can run it in Simulink or use MATLAB script optimization.

---

## 💻 3. ABS MATLAB Script — Tata Sierra SUV

**Folder:** `ABS_Tata_Sierra_SUV/`  
Includes a MATLAB script that simulates ABS braking for a real SUV (Tata Sierra) case:

✔ Takes user input speed (km/h)  
✔ Computes  
- initial linear and angular speeds  
- deceleration  
- stopping time and distance  
✔ Generates  
- Wheel speed plot (zig-zag oscillation)  
- Vehicle speed plot (smooth decay)  

### Example Outputs
Enter vehicle speed in km/h: 80

Initial Vehicle Speed = 22.22 m/s
Initial Wheel Speed = 67.34 rad/s
Estimated Stopping Time ≈ 2.52 sec
Estimated Stopping Distance ≈ 27.97 meters

yaml
Copy code

Outputs plots showing realistic ABS behavior.

---

## 📊 Results & Interpretation

| Output | Description |
|--------|-------------|
| Wheel Speed | Oscillatory decay due to ABS modulation |
| Vehicle Speed | Smooth deceleration to zero |
| Stopping Distance | Matches theoretical \(s = v^2/2a\) |
| Slip Curve | Maintains optimal slip (~0.2) for peak µ |

This confirms successful modeling of ABS behavior.

---

## 📌 Theory Behind ABS

- Slip ratio is the controlled variable:  
  \[
  λ = \frac{v - ωR}{v}
  \]
- ABS controller switches brake torque to maintain slip near desired value. :contentReference[oaicite:2]{index=2}
- The μ–slip curve defines peak friction point for optimal braking.

ABS improves braking distance and steering control compared to non-ABS braking.

---

## 📥 Getting Started

### Prerequisites
- Arduino IDE for embedded code
- MATLAB & Simulink for simulation
- Basic electronics components for hardware setup

### Run Simulations
1. Open Simulink model
2. Set parameters for desired road condition
3. Run simulation, observe plots

### Run MATLAB Script
```matlab
ABS_Model.m
Interactive input and plots will be generated.
