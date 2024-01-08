import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:fitness_app/common_widget/round_textfield.dart';
import 'package:fitness_app/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

import 'complete_profile.dart';

class Login_view extends StatefulWidget {
  const Login_view({super.key});

  @override
  State<Login_view> createState() => _Login_view();
}

class _Login_view extends State<Login_view> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text('Hey there,',
                 style: TextStyle(
                  color: Tcolo.gray,
                  fontSize: 16
                 ),
                 ),
                 Text('Welcome Back',
                 style: TextStyle(
                  color: Tcolo.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                 ),
                 ),
                 SizedBox(height: media.width *0.05,),
                 
                 RoundTextField(
                  hintText:'Email' ,
                  icon:'assets/img/Message.png',
                  keyboardType: TextInputType.emailAddress),
                   SizedBox(height: media.width *0.05,),
                 RoundTextField(
                  hintText:'Password' ,
                  icon:'assets/img/Lock.png',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  rightIcon: TextButton(onPressed: (){
                   
                  }, child:
                  Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/img/Hide-Password.png',
                      width: 20,
                      height: 20,fit: BoxFit.contain,
                      color: Tcolo.gray,)) ),
                  ),
                   SizedBox(height: media.width *0.6,),
                  RoundButton(textColor: Tcolo.white,title: 'Login',onPressed: (){
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomeView()));
                    
                  },
                  buttonColor:  Tcolo.Primarycolor1,),
                  SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Tcolo.gray.withOpacity(0.5),
                    )),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: Tcolo.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Tcolo.gray.withOpacity(0.5),
                    )
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don’t have an account yet? Register ",
                        style: TextStyle(
                          color: Tcolo.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: Tcolo.Secondarycolor1,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
