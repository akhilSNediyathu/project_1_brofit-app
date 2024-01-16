import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/workout_list.dart';
import 'package:fitness_app/common_widget/completed_workout.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:flutter/material.dart';

class SixpackSet3 extends StatelessWidget {
  const SixpackSet3 ({super.key});

   @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
  const   String iconImage = 'assets/img/Icon-Next.png';








    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
          title: Text('Abdominal toning',style: TextStyle(fontWeight: FontWeight.w600,color:Tcolo.white ),),
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
        
                const Text('Set-3'),
                SizedBox(height:media.height*0.02 ,),
                WorkoutList(imageUrl: 'assets/img/planktap.png', onIconTap: (){}, title: 'Plank -Tap', subtitle: '00:30', trailingimageUrl: iconImage),
                 SizedBox(height:media.height*0.01 ,),
                WorkoutList(imageUrl: 'assets/img/plank.png', onIconTap: (){}, title: 'Plank', subtitle: '00:30', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.01 ,),
                WorkoutList(imageUrl: 'assets/img/mountainclimp.png', onIconTap: (){}, title: 'Mountain Climb', subtitle: '00:30', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.01 ,),
                WorkoutList(imageUrl: 'assets/img/halfsitups.png', onIconTap: (){}, title: 'Half Sit-Ups', subtitle: '15x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.01 ,),
                 WorkoutList(imageUrl: 'assets/img/russiantwist.png', onIconTap: (){}, title: 'Russian Twist', subtitle: '15x', trailingimageUrl: iconImage),
                 SizedBox(height:media.height*0.01 ,),
                  WorkoutList(imageUrl: 'assets/img/bycyclecrunch.png', onIconTap: (){}, title: 'Bicycle Crunch', subtitle: '15x', trailingimageUrl: iconImage),
                  
                  const Spacer(),
                 RoundButton(title: 'Finish workout ', onPressed: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const CompletedWorkout()));

                 }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
                  
        
        
        
              ],
            ),
          ),
        ),
    );
  }


}