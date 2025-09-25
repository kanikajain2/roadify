import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadify/page1.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  print("Firebase INITIALIZED");
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
