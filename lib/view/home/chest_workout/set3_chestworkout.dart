import 'package:fitness_app/common/workout_list.dart';
import 'package:fitness_app/common_widget/completed_workout.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:flutter/material.dart';

import '../../../common/colo_extension.dart';

class ChestWorkoutSet3 extends StatelessWidget {
  const ChestWorkoutSet3({super.key});

  @override
  Widget build(BuildContext context) {
     const   String iconImage = 'assets/img/Icon-Next.png';
    var media = MediaQuery.of(context).size;
   return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
          title: Text('Comprehensive Chest Routine',style: TextStyle(fontWeight: FontWeight.w600,color:Tcolo.white ),),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
              end: Alignment.topLeft,
                 begin: Alignment.bottomRight,
                colors: Tcolo.tertiaryG,

              ),
            ),
          ),
        ),
        body: 
        
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Text('Exercises',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)),
        
                const Text('set-3'),
                
                 SizedBox(height:media.height*0.03 ,),
                WorkoutList(imageUrl: 'assets/img/widened push up.png', onIconTap: (){}, title: 'Widened Push-Ups', subtitle: '15x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.02 ,),
                WorkoutList(imageUrl: 'assets/img/pushup.png', onIconTap: (){}, title: 'Clap Push-Ups', subtitle: '15x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.02 ,),
                WorkoutList(imageUrl: 'assets/img/rest.png', onIconTap: (){}, title: 'Rest and Drink', subtitle: '02:00', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.02 ,),
                 WorkoutList(imageUrl: 'assets/img/diamond push up.png', onIconTap: (){}, title: 'Explosive  Push-Ups', subtitle: '12x', trailingimageUrl: iconImage),
                 SizedBox(height:media.height*0.02 ,),
                  WorkoutList(imageUrl: 'assets/img/chest dips.png', onIconTap: (){}, title: 'Chest dips', subtitle: '15x', trailingimageUrl: iconImage),
                  const Spacer(),
                 RoundButton(title: 'Finish workout ', onPressed: (){
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>CompletedWorkout()));

                 }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
                  
        
        
        
              ],
            ),
          ),
        ),
    );
  }


}