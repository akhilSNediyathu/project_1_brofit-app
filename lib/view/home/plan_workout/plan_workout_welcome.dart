import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/common_text_styles.dart';
import 'package:brofit/view/home/plan_workout/add_workout_plan.dart';

import 'package:flutter/material.dart';

class PlanWorkoutWelcome extends StatelessWidget {
  const PlanWorkoutWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
           
                 crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Workout Schedule',style: AppTextStyles.subtitleTextStyle(context),),
              SizedBox(height:media.height*0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/planworkoutwelcome.png',height: media.height*0.2,),
                  
                ],
              ),
               Center(child: Text('Plan your workout session and conquer your fitness goals with personalized routines tailored just for you',style:AppTextStyles.carousalStyle3,textAlign: TextAlign.center,)),
               SizedBox(height:media.height*0.09),
               SizedBox(
                height: media.height*0.3,
                width: media.width*0.8,
               
                child: Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Center(child: Image.asset('assets/img/plan.png')),
                      SizedBox(height: media.height*0.01,),
                      Text('Unstoppable Transformation',style: AppTextStyles.subtitleTextStyle(context)),
                      // ,
                      TextButton(onPressed: (){}, child: const Text('ViewDetails')),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const AddWorkoutPlan()));
                      }, child: const Text('Add')),

                    ]

                  ),
                ),)
            ],
          ),
        ),
      )
    );
  }
}
