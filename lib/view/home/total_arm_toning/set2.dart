import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/testgif.dart';
import 'package:fitness_app/common/workout_list.dart';
import 'package:fitness_app/common_widget/round_button_1.dart';
import 'package:fitness_app/view/home/total_arm_toning/set3.dart';
import 'package:flutter/material.dart';

class TotalArmToningSet2 extends StatelessWidget {
  const TotalArmToningSet2({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const   String iconImage = 'assets/img/Icon-Next.png';

void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congrats champ!'),
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
          MaterialPageRoute(builder: (context) => const TotalArmToningSet3()), // Replace with your target page
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
        
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Set-2',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    
                
                SizedBox(height:media.height*0.02 ,),
               
                WorkoutList(imageUrl: 'assets/img/pushup.png', onIconTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/push up.gif',
                                initialCounter: 30))
                                );
                }, title: 'Push-Ups', subtitle: '15x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.02 ,),
                WorkoutList(imageUrl: 'assets/img/declined push up.png', onIconTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/declinepushupnew.gif',
                                initialCounter: 30))
                                );
                }, title: 'Declined Push-Ups', subtitle: '15x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.02 ,),
                WorkoutList(imageUrl: 'assets/img/shouldertap.png', onIconTap: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/shouldertap.gif',
                                initialCounter: 30))
                                );
                }, title: 'Shoulder Tap', subtitle: '12x', trailingimageUrl: iconImage),
                SizedBox(height:media.height*0.02 ,),
                 WorkoutList(imageUrl: 'assets/img/diamond push up.png', onIconTap: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/damond pushup.gif',
                                initialCounter: 30))
                                );
                 }, title: 'Diamond Push-Ups', subtitle: '12x', trailingimageUrl: iconImage),
                 SizedBox(height:media.height*0.02 ,),
                  WorkoutList(imageUrl: 'assets/img/triceps dips.png', onIconTap: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/tricepdips.gif',
                                initialCounter: 30))
                                );
                  }, title: 'Triceps-dips', subtitle: '15x', trailingimageUrl: iconImage),
                  const Spacer(),
                 RoundButton(
                  title: 'Set-3 ', onPressed: (){
                  showCustomDialog(context);
                  
                 }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
                  
                    
                    
                    
              ],
            ),
          ),
        ),
    );
  }
 
}