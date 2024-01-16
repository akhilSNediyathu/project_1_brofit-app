import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:fitness_app/view/home/leg_workout/set2_leg_workout.dart';
import 'package:flutter/material.dart';

import '../../../common/workout_list.dart';

class LegWorkoutSet1 extends StatelessWidget {
  const LegWorkoutSet1({super.key});

@override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
  const   String iconImage = 'assets/img/Icon-Next.png';



void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/img/showdialogue.png', 
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                const Text("Great work! You've crushed your first set. Now, conquer the next two and own the full three-set challenge!"),
              ],
            ),
          );
        },
      );

      // Delay for 3 seconds before navigating to another page
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LegWorkoutSet2()), // Replace with your target page
        );
      });
    }




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
                  
              const Text('set-1'),
              SizedBox(height:media.height*0.02 ,),
              WorkoutList(imageUrl: 'assets/img/warmup.png', onIconTap: (){}, title: 'Warm Up', subtitle: '05:00', trailingimageUrl: iconImage),
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
               RoundButton(title: 'Set-2 ', onPressed: (){
                showCustomDialog(context);
          
               }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
                
                  
                  
                  
            ],
          ),
        ),
    );
  }


}