import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginflutter/screens/Homepage.dart';
import 'package:loginflutter/screens/LoginScreen.dart';


class AuthScreen extends StatelessWidget {
const AuthScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Homepage();
        }else{
          return LoginScreen();
        }
      },
    ),

    );
  }
}