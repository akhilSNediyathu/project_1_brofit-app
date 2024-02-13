
import 'package:brofit/common/testgif.dart';
import 'package:brofit/common/workout_list.dart';
import 'package:brofit/common_widget/completed_workout.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/view/home/workout_history_db/history_db_functions.dart';
import 'package:brofit/view/home/workout_history_db/history_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/colo_extension.dart';

class ChestWorkoutSet3 extends StatelessWidget {
  const ChestWorkoutSet3({super.key});

  @override
  Widget build(BuildContext context) {
    const String iconImage = 'assets/img/Icon-Next.png';
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Comprehensive Chest Routine',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              'Exercises',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
            const Text('set-3'),
            SizedBox(
              height: media.height * 0.03,
            ),
            WorkoutList(
                imageUrl: 'assets/img/widened push up.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/wide-arm-push-ups (1) (1).gif',
                              initialCounter: 30)));
                },
                title: 'Widened Push-Ups',
                subtitle: '15x',
                trailingimageUrl: iconImage),
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
                              gifPath: 'assets/gif/clapping-push-ups.gif',
                              initialCounter: 30)));
                },
                title: 'Clap Push-Ups',
                subtitle: '15x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.02,
            ),
            WorkoutList(
                imageUrl: 'assets/img/rest.png',
                onIconTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/watertime.gif',
                              initialCounter: 120)));

                },
                title: 'Rest and Drink',
                subtitle: '02:00',
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
                              gifPath: 'assets/gif/plyometric-push-ups (1).gif',
                              initialCounter: 30)));
                },
                title: 'Explosive  Push-Ups',
                subtitle: '12x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.02,
            ),
            WorkoutList(
                imageUrl: 'assets/img/chest dips.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/parallel-bar-dip.gif',
                              initialCounter: 30)));
                },
                title: 'Chest dips',
                subtitle: '15x',
                trailingimageUrl: iconImage),
            const Spacer(),
            RoundButton(
             
                title: 'Finish workout ',
                onPressed: ()async {
                  DateTime now = DateTime.now();
        String formattedDate = DateFormat('dd MMM yyyy').format(now);

        await addWorkoutHistory(
          todayhistory: WorkoutHistory(
            id: formattedDate,
            dailyWokout: 'Accomplished the chest routine',
          ),
        );
                  
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
    );
  }
}
