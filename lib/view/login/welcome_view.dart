import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/view/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common/common_text_styles.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
 User? _user;
   String? _userName;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

Future<void> _loadUserData() async {
 
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
     
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('UserDetails')
          .doc(user.email) 
          .get();

    
      String userName = userData['Name'];

      setState(() {
        _user = user;
        _userName = userName;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SafeArea(
        child: SizedBox(
          
          // width: media.width,
          // padding: const EdgeInsets.symmetric(vertical:10,horizontal: 10 ),
          child: _user != null? SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                 Image.asset('assets/img/welcomenew.jpeg',fit: BoxFit.cover,
                 
                  width: media.width, 
                         height: media.height * 0.4
                 ),
                SizedBox(height: media.height*0.03,),
               
                   Text("Welcome, $_userName",
                   style: AppTextStyles.titleTextStyle,
                   ),
                   Text("You are all set now, let's reach your \ngoals together with us",
                   textAlign: TextAlign.center,
                   style: AppTextStyles.welcomeSubtitle
                   ),
               const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      child: RoundButton(
                         
                      
                      textColor: Tcolo.white,
                      title: 'Go To Home',
                      onPressed: () {
                         Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>const HomePage()));
                      },
                      buttonColor: Tcolo.Primarycolor1,
                                      ),
                    ),
                    
                    
              ],
            ),
          ): Center(child: SizedBox(
                width: media.width * 0.5,
                height: media.width * 0.5,
                child: Lottie.asset(
                  'assets/gif/loading...json',
                  fit: BoxFit.cover,
                ),
              ),),
        ),
      ),
    );
  }
}