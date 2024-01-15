import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/workout_list.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:fitness_app/view/home/total_arm_toning/set2.dart';
import 'package:flutter/material.dart';

class TotalArmToning extends StatelessWidget {
  const TotalArmToning({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
  const   String iconImage = 'assets/img/Icon-Next.png';



void _showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulations!'),
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
                SizedBox(height: 10),
                Text("Great work! You've crushed your first set. Now, conquer the next two and own the full three-set challenge!"),
              ],
            ),
          );
        },
      );

      // Delay for 3 seconds before navigating to another page
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TotalArmToningSet2()), // Replace with your target page
        );
      });
    }




    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
          title: Text('Arm annihilation',style: TextStyle(fontWeight: FontWeight.w600,color:Tcolo.white ),),
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
                Center(child: Text('Exercises',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)),
        
                Text('set-1'),
                SizedBox(height:media.height*0.02 ,),
                WorkoutList(imageUrl: 'assets/img/warmup.png', onIconTap: (){}, title: 'Warm Up', subtitle: '05:00', trailingimageUrl: iconImage),
                 SizedBox(height:media.height*0.01 ,),
                WorkoutList(imageUrl: 'assets/img/pushup.png', onIconTap: (){}, title: 'Push-Ups', subtitle: '15x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.01 ,),
                WorkoutList(imageUrl: 'assets/img/declined push up.png', onIconTap: (){}, title: 'Declined Push-Ups', subtitle: '15x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.01 ,),
                WorkoutList(imageUrl: 'assets/img/shouldertap.png', onIconTap: (){}, title: 'Shoulder Tap', subtitle: '12x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.01 ,),
                 WorkoutList(imageUrl: 'assets/img/diamond push up.png', onIconTap: (){}, title: 'Diamond Push-Ups', subtitle: '12x', trailingimageUrl: iconImage),
                 SizedBox(height:media.height*0.01 ,),
                  WorkoutList(imageUrl: 'assets/img/triceps dips.png', onIconTap: (){}, title: 'Triceps-dips', subtitle: '15x', trailingimageUrl: iconImage),
                  Spacer(),
                 RoundButton(title: 'Set-2 ', onPressed: (){
                  _showCustomDialog(context);

                 }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
                  
        
        
        
              ],
            ),
          ),
        ),
    );
  }


}