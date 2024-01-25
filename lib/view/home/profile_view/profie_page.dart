import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/common_text_styles.dart';
// import 'package:brofit/view/login/login_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
//       body: TextButton(onPressed: (){
//         FirebaseAuth.instance.signOut();
//         Navigator.pushAndRemoveUntil(
//   context,
//   MaterialPageRoute(
//     builder: (context) => const LoginView(),
//   ),
//   (route) => false,
// );
//       }, child: const Icon(Icons.logout_sharp)),
backgroundColor: Tcolo.white,
body: SingleChildScrollView(
  child: Column(
    children: [
      Center(child: Text('Profile',style: AppTextStyles.carousalHeading2TextStyle,)),
      SizedBox(height: media.height*0.03,),
      

    ],
  ),
),
    );
  }
}