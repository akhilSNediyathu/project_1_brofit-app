import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String icon;
  final Widget? rightIcon;
  final EdgeInsets? margin;
  final TextInputType? keyboardType;
  final bool obscureText;
  const RoundTextField({super.key,required this.hintText,required this.icon,this.controller,this.margin,this.keyboardType,this.obscureText=false,this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: margin,
      
                decoration:BoxDecoration(
                  color: Tcolo.Lightgrey,borderRadius: BorderRadius.circular(15)
                ) ,
                child: TextField(
                  obscureText: obscureText,
                  
                   keyboardType: keyboardType,
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Image.asset(icon,
                      width: 20,
                      height: 20,fit: BoxFit.contain,
                      color: Tcolo.gray,)),
                    hintText: hintText,
                    suffixIcon: rightIcon,
                    hintStyle: TextStyle(
                      color: Tcolo.gray,
                      fontSize: 12
                    )
                  ),
                ),
               );
  }
}