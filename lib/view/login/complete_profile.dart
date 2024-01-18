import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/round_button_1.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_textfield.dart';
import 'carousal_view.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  TextEditingController txtDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
             Image.asset('assets/img/complete profile.png',width: media.width,fit: BoxFit.fitWidth,),
              SizedBox(height: media.width *0.05,),
             
                 Text("Let's complete your profile",
                 style: TextStyle(
                  color: Tcolo.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                 ),
                 ),
                 Text("It will help us to know more about you!",
                 style: TextStyle(
                  color: Tcolo.gray,
                  fontSize: 13
                 ),
                 ),
                 SizedBox(height: media.width *0.05,),
                 Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 15),
                   
                   child: Column(
                     children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Tcolo.Lightgrey,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  
                                  child: Image.asset(
                                    "assets/img/2 User.png",
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                    color: Tcolo.gray,
                                  )),
                            
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    items: ["Male", "Female"]
                                        .map((name) => DropdownMenuItem(
                                              value: name,
                                              child: Text(
                                                name,
                                                style: TextStyle(
                                                    color: Tcolo.gray,
                                                    fontSize: 14),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {},
                                    isExpanded: true,
                                    hint: Text(
                                      "Choose Gender",
                                      style: TextStyle(
                                          color: Tcolo.gray, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),

                             const SizedBox(width: 8,)

                            ],
                          ),),
                          SizedBox(
                  height: media.width * 0.04),
                       RoundTextField(
                        hintText:'Date of Birth' ,
                        icon:'assets/img/Calendar.png',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        
                        ),
                        SizedBox(
                  height: media.width * 0.04),
                        Row(
                          children: [
                            Expanded(child:RoundTextField(
                        hintText:'Your Weight' ,
                        icon:'assets/img/weight-scale 1.png',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        
                        ),
                        ),
                       const SizedBox(width: 8,),
                        Container(width: 50,
                        height: 50,
                        alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: Tcolo.SecondaryG),borderRadius: BorderRadius.circular(15),

                          ),
                          child: Text('KG',style: TextStyle(
                           color: Tcolo.white, 
                           fontSize: 12
                          ),)
                        )
                          ],
                        ),
                         SizedBox(
                  height: media.width * 0.04),
                        Row(
                          children: [
                            Expanded(child:RoundTextField(
                        hintText:'Your Height' ,
                        icon:'assets/img/Swap.png',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        
                        ),
                        ),
                       const SizedBox(width: 8,),
                        Container(width: 50,
                        height: 50,
                        alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: Tcolo.SecondaryG),borderRadius: BorderRadius.circular(15),

                          ),
                          child: Text('CM',style: TextStyle(
                           color: Tcolo.white, 
                           fontSize: 12
                          ),)
                        )
                          ],
                        ),
                         SizedBox(height: media.width *0.09,),
                  RoundButton(
                 textColor: Tcolo.white,title: 'Next >',onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const WhoNeedsMe()));
                  },
                  buttonColor:  Tcolo.Primarycolor1,),
                     ],
                   ),
                 ),
                  
            ],
          ),
        ),
      ),
    );
  }
}