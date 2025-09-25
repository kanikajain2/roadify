import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadify/login.dart';
import 'package:roadify/registration.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/logo.png", height: 400),

                SizedBox(height: 5),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registration()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    padding: EdgeInsetsDirectional.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: Colors.black26,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 255, 112, 30),
                          const Color.fromARGB(255, 255, 134, 63),
                          const Color.fromARGB(255, 253, 112, 30),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Center(
                        child: Text(
                          "Get started with roadify".toUpperCase(),
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

                SizedBox(height: 6),

                InkWell(
                  onHover: (hovering) {},
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text("Already created an account?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
