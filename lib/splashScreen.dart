import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/view/main_tab_view.dart';
import 'package:fitness_app/view/on_boarding_screeens/started_view.dart';
import 'package:flutter/material.dart';

import 'common/colo_extension.dart';

class Splash extends StatefulWidget {
 Splash({super.key});

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
                image: DecorationImage(image: AssetImage('assets/img/newsplash.png',),fit: BoxFit.fitWidth),
                ),),
            )
            ],
            ),
          ),
      ),
    );
  }
  Future <void> goToLogin()async{

   await Future.delayed(Duration(seconds: 3)
    );
    final check = FirebaseAuth.instance.currentUser ;
   if(check==null){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>OnBoardingView()));

   }else{
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>MainTabView()));

    }
   

  }

}
