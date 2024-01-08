import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:fitness_app/view/main_tab_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SafeArea(
        child: Container(
          width: media.width*1,
          // padding: const EdgeInsets.symmetric(vertical:10,horizontal: 10 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
               Image.asset('assets/img/welcomenew.jpeg',fit: BoxFit.fill,
               ),
              SizedBox(height: media.width *0.1,),
             
                 Text("Welcome, Akhil",
                 style: TextStyle(
                  color: Tcolo.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                 ),
                 ),
                 Text("You are all set now, let's reach your \ngoals together with us",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                  color: Tcolo.gray,
                  fontSize: 13
                 ),
                 ),
             const Spacer(),
                  RoundButton(
                  textColor: Tcolo.white,
                  title: 'Go To Home',
                  onPressed: () {
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainTabView()));
                  },
                  buttonColor: Tcolo.Primarycolor1,
                ),


            ],
          ),
        ),
      ),
    );
  }
}