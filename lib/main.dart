import 'package:flutter/material.dart';

void main() {
  runApp(const BitacoraApp());
}

class BitacoraApp extends StatelessWidget {
  const BitacoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitácora Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BitacoraPage(),
    );
  }
}

class BitacoraPage extends StatelessWidget {
  const BitacoraPage({super.key});

  Widget temaCard(String titulo, String descripcion) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bitácora de Flutter"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            temaCard(
              "1. Presentación: ¿Qué es Flutter?",
              "Flutter es un framework de desarrollo creado por Google que permite desarrollar aplicaciones móviles, web y de escritorio utilizando un único código fuente. Se caracteriza por ofrecer un alto rendimiento, una gran variedad de widgets y una interfaz moderna.",
            ),
            temaCard(
              "2. Instalación de Flutter",
              "Durante este tema se realizó la instalación del SDK de Flutter, la configuración de las variables de entorno y la instalación de Android Studio y Visual Studio Code. También se verificó la correcta instalación mediante el comando 'flutter doctor'.",
            ),
            temaCard(
              "3. Sintaxis básica de Dart",
              "Se estudiaron los fundamentos del lenguaje Dart, incluyendo variables, tipos de datos, operadores, condicionales, ciclos, funciones, clases y objetos. Estos conceptos constituyen la base para desarrollar aplicaciones con Flutter.",
            ),
            temaCard(
              "4. Estructura básica de Flutter",
              "Se conoció la estructura principal de un proyecto Flutter, identificando archivos importantes como main.dart, pubspec.yaml y las carpetas lib, android e ios. Además, se comprendió el funcionamiento de MaterialApp, Scaffold y StatelessWidget.",
            ),
            temaCard(
              "5. Widget Container",
              "Se trabajó con el widget Container para crear espacios personalizados dentro de la interfaz. Se aprendió a modificar propiedades como ancho, alto, margen, padding, color, bordes y alineación para diseñar interfaces más organizadas.",
            ),
            temaCard(
              "6. Consumo de APIs",
              "Se aprendió a conectar una aplicación Flutter con servicios web mediante APIs. Se realizaron solicitudes HTTP para obtener información en formato JSON y mostrar los datos dinámicamente dentro de la aplicación.",
            ),
            temaCard(
              "7. Diseño Responsivo y Adaptabilidad",
              "Se desarrollaron interfaces capaces de adaptarse a diferentes tamaños de pantalla utilizando herramientas como MediaQuery, LayoutBuilder y widgets flexibles. Esto permite que la aplicación funcione correctamente en teléfonos, tabletas y computadoras.",
            ),
          ],
        ),
      ),
    );
  }
}