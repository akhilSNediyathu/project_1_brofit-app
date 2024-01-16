import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/workout_list.dart';
import 'package:fitness_app/common_widget/completed_workout.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:flutter/material.dart';

class LegWorkoutSet3 extends StatelessWidget {
  const LegWorkoutSet3({super.key});

 @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
  const   String iconImage = 'assets/img/Icon-Next.png';







    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
          title: Text('Domicile Leg Regimen',style: TextStyle(fontWeight: FontWeight.w600,color:Tcolo.white ),),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text('Exercises',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)),
                  
              const Text('Set-3'),
             
               SizedBox(height:media.height*0.01 ,),
              WorkoutList(imageUrl: 'assets/img/squatup.png', onIconTap: (){}, title: 'Squat-Ups', subtitle: '15x', trailingimageUrl: iconImage),
              SizedBox(height:media.height*0.01 ,),
              WorkoutList(imageUrl: 'assets/img/splitsquat.png', onIconTap: (){}, title: 'Split Squats', subtitle: '15x', trailingimageUrl: iconImage),
              SizedBox(height:media.height*0.01 ,),
              
              WorkoutList(imageUrl: 'assets/img/rest.png', onIconTap: (){}, title: 'Rest and Drink', subtitle: '02:00', trailingimageUrl: iconImage),
              SizedBox(height:media.height*0.02 ,),
              WorkoutList(imageUrl: 'assets/img/calfraise.png', onIconTap: (){}, title: 'Calf Raise', subtitle: '15x', trailingimageUrl: iconImage),
              SizedBox(height:media.height*0.01 ,),
               WorkoutList(imageUrl: 'assets/img/jumpsquat.png', onIconTap: (){}, title: 'Jump Squat', subtitle: '12x', trailingimageUrl: iconImage),
               SizedBox(height:media.height*0.01 ,),
                WorkoutList(imageUrl: 'assets/img/wallsit.png', onIconTap: (){}, title: 'Wall Sit ', subtitle: '15x', trailingimageUrl: iconImage),
                const Spacer(),
               RoundButton(title: 'Set-3 ', onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const CompletedWorkout()));
               
          
               }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
                
                  
                  
                  
            ],
          ),
        ),
    );
  }


}