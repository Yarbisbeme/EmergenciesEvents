import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Desarrollado por: Yarbis Beltré Mercedes
// Matrícula: 20220907
// Descripción: Sistema de Diseño Profesional (Design System) para App 911

class AppTheme {
  // Paleta de colores base
  static const Color _primaryRed = Color(0xFFD32F2F); // Rojo urgencia
  static const Color _surfaceLight = Color(0xFFF8F9FA); // Blanco humo
  static const Color _surfaceDark = Color(0xFF121212); // Gris asfalto oscuro

  // --- TEMA CLARO ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryRed,
      primary: _primaryRed,
      brightness: Brightness.light,
      surface: _surfaceLight,
    ),
    // Tipografía moderna y limpia
    fontFamily: GoogleFonts.inter().fontFamily,
    
    // Diseño global de la barra superior
    appBarTheme: AppBarTheme(
      backgroundColor: _primaryRed,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
    ),
    
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: _primaryRed),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: _primaryRed),
      titleSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: _surfaceDark),
    ),

    // Diseño global de los campos de texto
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: _primaryRed, width: 2)),
      labelStyle: TextStyle(color: Colors.grey.shade600),
    ),
    
    // Diseño global de los botones principales
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryRed,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
      ),
    ),
  );

  // --- TEMA OSCURO ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryRed,
      primary: _primaryRed,
      brightness: Brightness.dark,
      surface: _surfaceDark,
    ),
    fontFamily: GoogleFonts.inter().fontFamily,
    
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: _primaryRed),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: _primaryRed),
      titleSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: _surfaceLight),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: _surfaceDark,
      foregroundColor: _primaryRed, // El texto y los íconos se vuelven rojos
      centerTitle: true,
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700, color: _primaryRed),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E1E1E), // Gris un poco más claro que el fondo
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: _primaryRed, width: 2)),
      labelStyle: TextStyle(color: Colors.grey.shade400),
    ),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryRed,
        foregroundColor: Colors.white,
        elevation: 4, // Más sombra en modo oscuro para resaltar
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
      ),
    ),
  );
}