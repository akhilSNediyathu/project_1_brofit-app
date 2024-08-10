import 'package:flutter/material.dart';

import '../utils/colo_extension.dart';

class RoundTextField extends StatefulWidget {
  //  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final TextEditingController? controller;
  final String hintText;
  final String icon;
  final Widget? rightIcon;
  final EdgeInsets? margin;
  final TextInputType? keyboardType;
  final bool obscureText;
    
    final FormFieldValidator<String>? validator;
  const RoundTextField({super.key,required this.hintText,required this.icon,this.controller,this.margin,this.keyboardType,this.obscureText=false,this.rightIcon,this.validator});

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
                child: TextFormField(
                  obscureText: widget.obscureText,
                  validator:  widget.validator,
                   keyboardType: widget.keyboardType,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                     disabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Tcolo.gray,width: 2),),
                     focusedErrorBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: const BorderSide(color: Color.fromARGB(255, 194, 13, 0),width: 2),) ,
                    enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Tcolo.gray,width: 2),),
                    errorBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: const BorderSide(color: Color.fromARGB(255, 255, 89, 78),width: 2),),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Tcolo.Primarycolor1,width: 2)),
                    prefixIcon: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Image.asset(widget.icon,
                      width: 20,
                      height: 20,fit: BoxFit.contain,
                      color: Tcolo.gray,)),
                    hintText: widget.hintText,
                    
                    // errorText: 'Please Fill This Field !',
                    
                    suffixIcon: widget.rightIcon,
                    hintStyle: TextStyle(
                      color: Tcolo.gray,
                      fontSize: 12
                    )
                  ),
                ),
               );
  }
}