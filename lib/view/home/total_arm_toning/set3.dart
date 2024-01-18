import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/testgif.dart';
import 'package:fitness_app/common/workout_list.dart';
import 'package:fitness_app/common_widget/completed_workout.dart';
import 'package:fitness_app/common_widget/round_button_1.dart';
import 'package:flutter/material.dart';

class TotalArmToningSet3 extends StatelessWidget {
  const TotalArmToningSet3({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const String iconImage = 'assets/img/Icon-Next.png';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Arm annihilation',
          style: TextStyle(fontWeight: FontWeight.w600, color: Tcolo.white),
        ),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            
        crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                              'Final Set',
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                            ),
              SizedBox(
                height: media.height * 0.02,
              ),
              WorkoutList(
                  imageUrl: 'assets/img/pushup.png',
                  onIconTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/push up.gif',
                                initialCounter: 30))
                                );
                  },
                  title: 'Push-Ups',
                  subtitle: '15x',
                  trailingimageUrl: iconImage),
              SizedBox(
                height: media.height * 0.02,
              ),
              WorkoutList(
                  imageUrl: 'assets/img/declined push up.png',
                  onIconTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/declinepushupnew.gif',
                                initialCounter: 30))
                                );
                  },
                  title: 'Declined Push-Ups',
                  subtitle: '15x',
                  trailingimageUrl: iconImage),
              SizedBox(
                height: media.height * 0.02,
              ),
              WorkoutList(
                  imageUrl: 'assets/img/shouldertap.png',
                  onIconTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/shouldertap.gif',
                                initialCounter: 30))
                                );
                  },
                  title: 'Shoulder Tap',
                  subtitle: '12x',
                  trailingimageUrl: iconImage),
              SizedBox(
                height: media.height * 0.02,
              ),
              WorkoutList(
                  imageUrl: 'assets/img/diamond push up.png',
                  onIconTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/damond pushup.gif',
                                initialCounter: 30))
                                );
                  },
                  title: 'Diamond Push-Ups',
                  subtitle: '12x',
                  trailingimageUrl: iconImage),
              SizedBox(
                height: media.height * 0.02,
              ),
              WorkoutList(
                  imageUrl: 'assets/img/triceps dips.png',
                  onIconTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomCounterDialog1(
                                gifPath: 'assets/gif/tricepdips.gif',
                                initialCounter: 30))
                                );
                  },
                  title: 'Triceps-dips',
                  subtitle: '15x',
                  trailingimageUrl: iconImage),
              const Spacer(),
              RoundButton(
                
                  title: 'Finish workout ',
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) =>const  CompletedWorkout()));
                  },
                  buttonColor: Tcolo.Primarycolor1,
                  textColor: Tcolo.white)
            ],
          ),
        ),
      ),
    );
  }
}
