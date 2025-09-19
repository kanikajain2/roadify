import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadify/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roadify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.abel(),
          prefixIconColor: const Color.fromARGB(255, 255, 123, 0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
      home: Page1(),
    );
  }
}
