// ignore_for_file: use_build_context_synchronously

import 'package:brofit/presentation/utils/colo_extension.dart';
import 'package:brofit/presentation/utils/common_padding.dart';
import 'package:brofit/presentation/utils/common_text_styles.dart';
import 'package:brofit/presentation/common_widget/round_button_1.dart';
import 'package:brofit/presentation/common_widget/round_textfield.dart';
import 'package:brofit/presentation/view/login/signup_view.dart';
import 'package:brofit/presentation/view/login/welcome_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool a = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    EdgeInsetsGeometry padding = ResponsivePadding.getPadding(context);
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            
            padding: padding,
            // const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              
            
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hey there,',
                    style: AppTextStyles.loginHeading1
                  ),
                  Text(
                    'Welcome Back',
                    style:  AppTextStyles.titleTextStyle,
                  ),
                  SizedBox(height: media.width * 0.05,),
               Form(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
                child: Column(
                children: [
                     RoundTextField(
                      validator: (value) {
                             if (value == null || value.isEmpty) {
                              return 'Please Fill This Field !';
                            } else {
                              return null;}},
                    hintText: 'Email',
                    icon: 'assets/img/Message.png',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  SizedBox(height: media.width * 0.05,),
                  RoundTextField(
                    validator: (value) {
                             if (value == null || value.isEmpty) {
                              return 'Please Fill This Field !';
                            } else {
                              return null;}},
                    hintText: 'Password',
                    icon: 'assets/img/Lock.png',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: a,
                    controller: passwordController,
                    rightIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          a=!a;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/img/Hide-Password.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: Tcolo.gray,
                        ),
                      ),
                    ),
                  ),
                  
                ],
               )),
                  SizedBox(height: media.width * 0.6,),
                  RoundButton(
                    
                    textColor: Tcolo.white,
                    title: 'Login',
                    onPressed: () {
                     if (_formKey.currentState!.validate()) {                   
                      loginUser(emailController.text, passwordController.text);
                      } else {}
                    },
                    buttonColor: Tcolo.Primarycolor1,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Tcolo.gray.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "  Or  ",
                        style: TextStyle(color: Tcolo.black, fontSize: 12),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Tcolo.gray.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  TextButton(
                    onPressed: () {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>const SignUpView()));
                    },
                    child: Row(
                    
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don't have an account yet? ",
                          style: AppTextStyles.loginEnding,
                        ),
                        Expanded(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Tcolo.Secondarycolor1,
                              fontSize: media.height*0.02,
                             fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 
  
   Future<void> loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeView()),
      );
    } catch (e) {
     
      String errorMessage = "An error occurred during login.";
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? "An unknown error occurred.";
      }

      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 3),
        ),
      );

       if (kDebugMode) {
         print("Error: $e");
       }
    }
  }

}
