import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/testgif.dart';
import 'package:brofit/common/workout_list.dart';
import 'package:brofit/common_widget/completed_workout.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/view/home/workout_history_db/history_db_functions.dart';
import 'package:brofit/view/home/workout_history_db/history_model.dart';

import 'package:flutter/material.dart';

class TotalArmToningSet3 extends StatefulWidget {
  const TotalArmToningSet3({super.key});

  @override
  State<TotalArmToningSet3> createState() => _TotalArmToningSet3State();
}

class _TotalArmToningSet3State extends State<TotalArmToningSet3> {
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
                  onPressed: () async{
                     await addWorkoutHistory(todayhistory: WorkoutHistory(id: DateTime.now().toLocal().toIso8601String().split('T')[0], dailyWokout: "Accomplished arm exercises"));
                     await getHistory();
                     
              
                    
                    
                    // ignore: use_build_context_synchronously
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
