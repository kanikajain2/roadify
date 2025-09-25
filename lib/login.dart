import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadify/page1.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Global key to validate the form
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers
  final emailtextcontroller = TextEditingController();
  final passtextcontroller = TextEditingController();

  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // State for loading indicator
  bool _isLoading = false;

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    emailtextcontroller.dispose();
    passtextcontroller.dispose();
    super.dispose();
  }

  // --- Login Logic ---
  void _loginUser() async {
    // Validate the form first
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      try {
        // Sign in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: emailtextcontroller.text.trim(),
          password: passtextcontroller.text.trim(),
        );

        // If login is successful, navigate to the home screen
        // Using pushReplacement to prevent user from going back to the login screen
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Page1()),
          );
        }
      } on FirebaseAuthException catch (e) {
        // Handle specific Firebase errors by showing the exact message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message ?? "An unknown authentication error occurred.",
            ),
          ),
        );
      } catch (e) {
        // Handle other unexpected errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred: $e')),
        );
      } finally {
        // Hide loading indicator
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),

                  Image.asset("images/logo.png", height: 150),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Text(
                          "WELCOME BACK",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 255, 123, 0),
                          ),
                        ),

                        const SizedBox(height: 5),
                        Text(
                          "Enter your details to login",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextFormField(
                          controller: emailtextcontroller,
                          decoration: const InputDecoration(
                            hintText: "E-mail Address",
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          controller: passtextcontroller,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        _isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: _loginUser,
                                style: ElevatedButton.styleFrom(
                                  elevation: 8,
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  shadowColor: Colors.black26,
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 255, 112, 30),
                                        Color.fromARGB(255, 255, 134, 63),
                                        Color.fromARGB(255, 253, 112, 30),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Container(
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "LOGIN",
                                        style: GoogleFonts.manrope(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
