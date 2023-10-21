import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_challenge_heyflutter/screens/onboarding.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 13, 129, 0),
  background: Colors.white,
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.background,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    titleSmall: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: theme,
      home: const OnboardingScreen(),
    );
  }
}
