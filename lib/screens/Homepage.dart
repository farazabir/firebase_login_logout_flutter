import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final user = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffE8F0FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed in as: " + user.email!,
            style: GoogleFonts.josefinSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),

            SizedBox(height: 20,),
            MaterialButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.deepPurple,
              child: Text("Log Out",
              style: const TextStyle(
                fontSize: 15,fontWeight: FontWeight.bold,
                color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}