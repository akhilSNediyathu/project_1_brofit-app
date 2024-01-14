// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/common/common_padding.dart';

import 'package:fitness_app/view/home/home_page.dart';

import 'package:fitness_app/view/on_boarding_screeens/started_view.dart';
import 'package:flutter/material.dart';

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
     EdgeInsetsGeometry padding = ResponsivePadding.getPadding(context);
    return Scaffold(
     
      body: Container(
        
         width: double.infinity,
       decoration:  BoxDecoration(
          gradient: LinearGradient(
                  colors: Tcolo.primaryG,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
            //  Text('B R O F I T',style: TextStyle(fontSize: 38,
            //            color: Colors.white,fontWeight: FontWeight.bold
            
            // ),),
            Opacity(
              opacity: .7,
              child: Container(
            height: media.height*0.75,
            width: media.width*0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                image: const DecorationImage(image: AssetImage('assets/img/newsplash.png',),fit: BoxFit.fitWidth),
                ),),
            )
            ],
            ),
          ),
      ),
    );
  }
  Future <void> goToLogin()async{

   await Future.delayed(const Duration(seconds: 3)
    );
    final check = FirebaseAuth.instance.currentUser ;
   if(check==null){
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const OnBoardingView()));

   }else{
       // ignore: use_build_context_synchronously
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const HomePage()));

    }
   

  }

}
