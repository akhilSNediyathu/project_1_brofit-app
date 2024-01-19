// sign_up_view.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/common_padding.dart';
import 'package:fitness_app/common_widget/round_button_1.dart';
import 'package:fitness_app/common_widget/round_textfield.dart';
import 'package:fitness_app/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'complete_profile.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  
    bool a = true;
    bool b = true;

   

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
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hey there,',
                    style: TextStyle(
                      color: Tcolo.gray,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Tcolo.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextField(
                    hintText: 'User Name',
                    icon: 'assets/img/Profile.png',
                    controller: firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
               
                  RoundTextField(
                    hintText: 'Email',
                    icon: 'assets/img/Message.png',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!isEmailValid(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextField(
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
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextField(
                    hintText: 'Confirm Password',
                    icon: 'assets/img/confirm-password3.png',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: b,
                    controller: confirmpasswordController,
                    rightIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          b=!b;
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
                  SizedBox(
                    height: media.width * 0.4,
                  ),
                  RoundButton(
                  
                    textColor: Tcolo.white,
                    title: 'Register',
                    onPressed: ()  {
                      if (passwordController.text ==
                          confirmpasswordController.text) {
                        if (_formKey.currentState!.validate()) {
                          registerUser(
                            emailController.text,
                            passwordController.text,
                          );
                           
                        }
                      } else {
                        passwordController.clear();
                        confirmpasswordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password doesn\'t match',
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.yellow,
                            duration: Duration(seconds: 3),
                          ),
                        );
                        // return null;
                      }
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
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
                            fontWeight: FontWeight.w700,
                          ),
                        )
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

  Future<void> registerUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  CompleteProfileView(name: firstNameController.text,)),
      );
    } catch (e) {
      String errorMessage = "An error occurred during registration.";
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? "An unknown error occurred.";
      }

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 3),
        ),
      );

      // print("Error: $e");
    }
  }
  bool isEmailValid(String email) {
    
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
}
