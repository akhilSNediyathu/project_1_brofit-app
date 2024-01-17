import 'package:fitness_app/common/colo_extension.dart';

import 'package:fitness_app/common_widget/round_button_1.dart';
import 'package:fitness_app/view/home/home_page.dart';
import 'package:flutter/material.dart';

class CompletedWorkout extends StatelessWidget {
  const CompletedWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
       body: SafeArea(
         child: Container(
          
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child:Column(
             mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
            
            height:media.height*0.4,
              
              child: Center(child: Image.asset('assets/img/newfinalbg.png'))),
              SizedBox(height: media.height*0.03,),
              const Center(child: Text("Congratulations!",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)),
               SizedBox(height: media.height*0.02,),
              const Text(
  "Great job on conquering all three sets! Let this fuel your motivation for more challenges on your fitness journey. Keep pushing boundaries!",
  textAlign: TextAlign.center, 
  
),
              const Spacer(),
              RoundButton(title: 'Back To Home', onPressed: (){
               Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => const HomePage(),
  ),
  (route) => false,
);

              }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
         
          ],
          )
               ),
       ),

    );
  }
}