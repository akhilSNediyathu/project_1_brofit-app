// ignore: file_names
import 'package:brofit/presentation/view/home/home_page.dart';
import 'package:brofit/presentation/view/on_boarding_screeens/started_view.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'common/colo_extension.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    goToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: media.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: Tcolo.primaryG,
                begin: Alignment.topCenter,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Opacity(
                  opacity: .7,
                  child: Container(
                    height: media.height * 0.8,
                    width: media.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/img/newsplash.png',
                          ),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: media.height*0.045,
                    width: media.width*0.18,
                    child: Lottie.asset('assets/gif/splash.json')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    final check = FirebaseAuth.instance.currentUser;
    if (check == null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const OnBoardingView()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomePage()));
    }
  }
}
