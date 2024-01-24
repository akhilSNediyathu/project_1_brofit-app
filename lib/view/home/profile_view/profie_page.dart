import 'package:brofit/view/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(onPressed: (){
        FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => const LoginView(),
  ),
  (route) => false,
);
      }, child: const Icon(Icons.logout_sharp)),
    );
  }
}