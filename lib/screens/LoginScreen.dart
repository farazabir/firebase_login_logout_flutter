import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  //SignIN function
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }


  //Dispose 
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffE8F0FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Hello User!",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome To our app.",
                  style: GoogleFonts.ptSans(
                    fontSize: 28,
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),

                //username Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFFE0DFD5)),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                       controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFFE0DFD5)),
                        borderRadius: BorderRadius.circular(12)),
                    child:Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                //Not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Not a member?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Be a member.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
