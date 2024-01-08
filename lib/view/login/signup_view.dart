import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:fitness_app/common_widget/round_textfield.dart';
import 'package:fitness_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

import 'complete_profile.dart';

class signUpView extends StatefulWidget {
  const signUpView({super.key});

  @override
  State<signUpView> createState() => _signUpViewState();
}

class _signUpViewState extends State<signUpView> {
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
                 Text('Create an Account',
                 style: TextStyle(
                  color: Tcolo.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                 ),
                 ),
                 SizedBox(height: media.width *0.05,),
                 RoundTextField(hintText:'First Name' ,icon:'assets/img/Profile.png',),
                 SizedBox(height: media.width *0.05,),
                 RoundTextField(
                  hintText:'Last Name' ,
                  icon:'assets/img/Profile.png',),
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
                  RoundButton(textColor: Tcolo.white,title: 'Register',onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CompleteProfileView()));
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
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login_view()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Tcolo.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Login",
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