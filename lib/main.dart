import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medfacil_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedFácil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        textTheme: GoogleFonts.juraTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

