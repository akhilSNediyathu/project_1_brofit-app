import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:fitness_app/view/main_tab_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BmiWelcome extends StatelessWidget {
  BmiWelcome({super.key});
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
         body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: media.height*0.15,
              child: Center(child: Image.asset('assets/img/bmi welcome.png'))),
              SizedBox(height: media.height*0.02,),
              
              const Center(child: Text("Check your BMI regularly",style: TextStyle(fontWeight:FontWeight.w700),)),
              SizedBox(height: media.height*0.02,),
              const Center(child: Text("it's a key indicator for your overall health, guiding ")),
              const Center(child: Text(' you toward better lifestyle choices.'),),  
              SizedBox(height: media.height*0.07,),
              Container(
      
      
               
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // key:formKey,
                  child: Column(
                    children: [
                      Container(decoration:BoxDecoration(
                  color: Tcolo.Lightgrey,borderRadius: BorderRadius.circular(15)
                ) ,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: media.width*0.5,
                                decoration:BoxDecoration(
                  color: Tcolo.Lightgrey,borderRadius: BorderRadius.circular(15)
                ) ,
                                child: TextFormField(
                                 
                                 
                                   keyboardType:TextInputType.number,
                                  controller: weightController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Container(
                                      alignment: Alignment.center,
                                      width: 20,
                                      height: 20,
                                      child: Image.asset('assets/img/Swap.png',
                                      width: 20,
                                      height: 20,fit: BoxFit.contain,
                                      color: Tcolo.gray,)),
                                    hintText: 'Enter Your Height',
                                   
                                    hintStyle: TextStyle(
                                      color: Tcolo.gray,
                                      fontSize: 12
                                    )
                                  ),
                                ),
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
                      ),
                      SizedBox(height: media.height*0.035,),
                      Container(
                        decoration: BoxDecoration(
                  color: Tcolo.Lightgrey,borderRadius: BorderRadius.circular(15)
                ) ,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                                 
                                                 
                                                   keyboardType:TextInputType.number,
                                                  controller: heightController,
                                                  decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Container(
                                alignment: Alignment.center,
                                width: 20,
                                height: 20,
                                child: Image.asset('assets/img/weight-scale 1.png',
                                width: 20,
                                height: 20,fit: BoxFit.contain,
                                color: Tcolo.gray,)),
                              hintText: 'Enter Your Weight',
                                                   
                              hintStyle: TextStyle(
                                color: Tcolo.gray,
                                fontSize: 12
                              )
                                                  ),
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
                      ),
                    ],
                  ),
                ),
               ),
               Container(
      
      
                decoration:BoxDecoration(
                  color: Tcolo.Lightgrey,borderRadius: BorderRadius.circular(15)
                ) ,
               ),
               const Spacer(),
               RoundButton(title: 'check', onPressed: (){

               }, 
               buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)

             
          ],
        )
      ),

    );
  }
}