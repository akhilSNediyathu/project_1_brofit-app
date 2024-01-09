import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

class RoundTextField extends StatefulWidget {
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final TextEditingController? controller;
  final String hintText;
  final String icon;
  final Widget? rightIcon;
  final EdgeInsets? margin;
  final TextInputType? keyboardType;
  final bool obscureText;
    final String? Function(String?)? validator;
   RoundTextField({super.key,required this.hintText,required this.icon,this.controller,this.margin,this.keyboardType,this.obscureText=false,this.rightIcon,this.validator});

  @override
  State<RoundTextField> createState() => _RoundTextFieldState();
}

class _RoundTextFieldState extends State<RoundTextField> {
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: widget.margin,
      
                decoration:BoxDecoration(
                  color: Tcolo.Lightgrey,borderRadius: BorderRadius.circular(15)
                ) ,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // key:formKey,
                  child: TextFormField(
                    obscureText: widget.obscureText,
                    validator: widget.validator,
                     keyboardType: widget.keyboardType,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: Image.asset(widget.icon,
                        width: 20,
                        height: 20,fit: BoxFit.contain,
                        color: Tcolo.gray,)),
                      hintText: widget.hintText,
                      suffixIcon: widget.rightIcon,
                      hintStyle: TextStyle(
                        color: Tcolo.gray,
                        fontSize: 12
                      )
                    ),
                  ),
                ),
               );
  }
}