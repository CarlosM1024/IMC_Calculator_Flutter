# 📱 BMI Calculator - Flutter App

A mobile application developed in Flutter to quickly and easily calculate your Body Mass Index (BMI). Designed with a clean and intuitive interface.

---

## ✨ Features

- ⚡ **Instant BMI Calculation**  
  Enter your height and weight to get your BMI immediately.

- 🩺 **BMI Classification**  
  Displays weight category results (Underweight, Normal, Overweight, Obese) based on **WHO standards**.

- 🎨 **Clean & User-Friendly UI**  
  Minimalist design with reusable components for better UX.

- ✅ **Input Validation**  
  Prevents invalid or null values to ensure accurate calculations.

- 🌍 **Cross-Platform Support**  
  Compatible with **Android**, **Windows**, **Linux**, and **Web** (if enabled).

---

## 📸 Screenshots

<p align="center">
  <img src="https://raw.githubusercontent.com/CarlosM1024/IMC_Calculator_Flutter/main/assets/screenshots/img.png" width="250"/>
  <img src="https://raw.githubusercontent.com/CarlosM1024/IMC_Calculator_Flutter/main/assets/screenshots/img_1.png" width="250"/>
  <img src="https://raw.githubusercontent.com/CarlosM1024/IMC_Calculator_Flutter/main/assets/screenshots/img_2.png" width="250"/>
  <img src="https://raw.githubusercontent.com/CarlosM1024/IMC_Calculator_Flutter/main/assets/screenshots/img_3.png" width="250"/>
</p>

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project and run it on your local machine.

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.

* An Android/iOS emulator or a connected physical device.

* A code editor (VS Code, Android Studio, etc.).

### Installation

1. **Clone the repository** :
```bash
git clone https://github.com/CarlosM1024/IMC_Calculator_Flutter.git
```
2. **Navigate to the project directory**:
```bash
cd IMC_Calculator_Flutter
```
3. **Install dependencies** :
```bash
flutter pub get
```
4. **Run the main.dart file** :
````bash
flutter run
````
---
## 🛠️ Project Structure

The project is organized to separate logic, UI, and reusable components:
````grapgql 
lib/
├── 📄 main.dart                 # Punto de entrada e inicialización de la aplicación
├── 📂 app/                      
│   └──  🏠 MiAplicacion.dart    # Configuración de la pantalla
└── 📂 screen/                   
    └── 📊 pantalla_01.dart      # Lógica de cálculo y visualizacion del IMC
````

---

## 🧮 Formula Used

The application uses the standard **Body Mass Index (BMI)** formula recommended by the  
**World Health Organization (WHO)**:

**BMI = weight (kg) / [height (m)]²**

| Parameter | Unit | Description |
|----------|------|-------------|
| **Weight** | Kilograms (kg) | Body mass of the individual |
| **Height** | Meters (m) | Height of the individual |

> **Note:** If height is entered in centimeters, the application automatically converts it to meters before performing the calculation.

---

## 👤 Author

**Carlos Antonio Martinez Miranda**

GitHub: [@CarlosM1024](https://github.com/CarlosM1024)