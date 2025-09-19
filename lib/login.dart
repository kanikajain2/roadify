import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadify/page1.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page1()),
                        );
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ],
                ),

                Image.asset("images/logo.png", height: 150),

                SizedBox(height: 10),

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

                      SizedBox(height: 5),
                      Text(
                        "Enter your details to login",
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),

                      SizedBox(height: 10),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "E-mail Address",
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SizedBox(height: 8),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),

                      SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: () => Registration()),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          padding: EdgeInsetsDirectional.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
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
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.symmetric(
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
    );
  }
}
