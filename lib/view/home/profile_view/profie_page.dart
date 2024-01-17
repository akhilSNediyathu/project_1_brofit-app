import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(onPressed: (){
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>const LoginView()));
      }, child: const Icon(Icons.logout_sharp)),
    );
  }
}