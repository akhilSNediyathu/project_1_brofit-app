import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/workout_list.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:fitness_app/view/home/chest_workout/set3_chestworkout.dart';
import 'package:flutter/material.dart';

class ChestWorkoutSet2 extends StatefulWidget {
  const ChestWorkoutSet2({super.key});

  @override
  State<ChestWorkoutSet2> createState() => _ChestWorkoutSet2State();
}

class _ChestWorkoutSet2State extends State<ChestWorkoutSet2> {
    @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
  const   String iconImage = 'assets/img/Icon-Next.png';



void _showCustomDialog(BuildContext context) {
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
                  'assets/img/showdialogue.png', // Replace with your image asset path
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                const Text("Awesome! Two sets down, one to go. Finish strong and conquer the challenge!"),
              ],
            ),
          );
        },
      );

      // Delay for 3 seconds before navigating to another page
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChestWorkoutSet3()), // Replace with your target page
        );
      });
    }




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
        
                const Text('set-2'),
                
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
                 RoundButton(title: 'Set-3 ', onPressed: (){
                  _showCustomDialog(context);

                 }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
                  
        
        
        
              ],
            ),
          ),
        ),
    );
  }


}