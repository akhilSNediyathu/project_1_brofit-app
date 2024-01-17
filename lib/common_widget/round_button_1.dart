
import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color buttonColor;
   final Color textColor;

  const RoundButton({super.key,required this.title,required this.onPressed,required this.buttonColor,required this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                        onPressed: onPressed,
                        height: 50,
                        //),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        textColor: Tcolo.Primarycolor2,
                        color:buttonColor,
                        minWidth: double.maxFinite,
                        
                          child: Text(
                            title,
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                      );
  }
}