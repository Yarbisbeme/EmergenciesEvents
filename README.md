<div align="center">
    <h1>🚨 Central de Emergencias 911</h1>
    <p>Una aplicación móvil desarrollada para el uso de equipos de primera respuesta y agentes del 911. Permite el registro rápido, seguro y local de incidentes de emergencia, adjuntando evidencia fotográfica y detalles críticos del evento en el lugar de los hechos.</p>
    <table align="center" style="border: none; width: 70%;">
    <tr style="border: none;">
        <td width="50%" align="center" style="border: none;">
        <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter" height="40" />
        <img src="https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" height="40" />
        <img src="https://img.shields.io/badge/sqlite-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white" alt="SQLite" height="40" />
        </td>
        <td width="50%" align="center" style="border: none;">
        <img src="assets/logoRecorte.jpg" alt="Logo 911" width="180" style="border-radius: 18px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);" />
        </td>
    </tr>
    </table>
</div>

----------------
## ✨ Características Principales

* **Registro de Eventos:** Creación de reportes detallados con título, descripción y fecha automática.
* **Evidencia Fotográfica:** Integración nativa con la cámara del dispositivo para capturar fotos de la escena (usando `image_picker`).
* **Persistencia Local (Modo Offline):** Almacenamiento seguro de datos en el dispositivo mediante **SQLite**, garantizando que la aplicación funcione en zonas sin cobertura de internet.
* **Sistema de Diseño Adaptativo:** Soporte completo e inteligente para **Modo Claro** y **Modo Oscuro** automático según las preferencias del sistema operativo.
* **Interfaz Profesional:** Construida con tipografía `Inter` (Google Fonts) y un UI/UX optimizado para lectura rápida en situaciones de estrés.

-------------------
## 🛠️ Stack Tecnológico y Librerías

* **Framework:** Flutter / Dart
* **Base de Datos:** `sqflite` (Motor SQLite) & `path_provider`
* **Cámara:** `image_picker`
* **Formateo de Fechas:** `intl`
* **Diseño UI:** `google_fonts`
* **Patrones de Diseño:** Singleton (para el manejador de la base de datos).

-----------
## 📂 Arquitectura del Proyecto

El código fuente está estructurado de manera escalable y modular:

```text
lib/
 ┣ core/
 ┃ ┗ theme.dart               # Motor de diseño, colores y soporte Dark Mode
 ┣ database/
 ┃ ┗ database_helper.dart     # Configuración de SQLite y operaciones CRUD
 ┣ model/
 ┃ ┗ emergency_event.dart     # Modelo de datos y serialización (toMap/fromMap)
 ┣ screens/
 ┃ ┣ add_event_screen.dart    # Formulario y acceso a cámara
 ┃ ┣ event_detail_screen.dart # Vista detallada del reporte
 ┃ ┗ home_screen.dart         # Dashboard principal y lista de registros
 ┗ main.dart                  # Punto de entrada de la aplicación
 ```
----------
 ## 🚀 Instalación y Uso
Para correr este proyecto en tu máquina local, asegúrate de tener el SDK de Flutter instalado.

1. **Clona este repositorio:**
```
git clone [https://github.com/yarbisbeme/emergencies911.git](https://github.com/yarbisbeme/emergencies911.git)
```
2. **Instala las dependencias:**
```
flutter pub get
```
3. **Conecta un dispositivo físico o inicia un emulador (Android/iOS).**

4. **Ejecuta la app:**
```
flutter run
```
----------
# 👨‍💻 Autor

<div align="center">
  <img src="assets/yarbis.png" width="150" height="150" style="border-radius: 50%; object-fit: cover; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
  
  ### Yarbis Beltré Mercedes
  **Software Developer & QA Engineer**

  Desarrollador enfocado en crear soluciones eficientes, automatizadas y escalables. Apasionado por la mejora continua, la automatización de procesos y el aseguramiento de calidad (QA). Cuando no estoy codeando, probablemente me encuentres en el piano. 🎹

  <br/>

  [![Contact Me](https://img.shields.io/badge/✉️_Contact_Me-673AB7?style=for-the-badge)](mailto:yarbisbeme@gmail.com)
  [![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://do.linkedin.com/in/yarbis-beltre-mercedes)
  [![GitHub](https://img.shields.io/badge/GitHub-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)]([github.com/tu-usuario](https://github.com/Yarbisbeme))
</div>