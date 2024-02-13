import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/testgif.dart';
import 'package:brofit/common/workout_list.dart';
import 'package:brofit/common_widget/completed_workout.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/view/home/workout_history_db/history_db_functions.dart';
import 'package:brofit/view/home/workout_history_db/history_model.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LegWorkoutSet3 extends StatelessWidget {
  const LegWorkoutSet3({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const String iconImage = 'assets/img/Icon-Next.png';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Domicile Leg Regimen',
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
            Container(
              color: Tcolo.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Text(
                    'Exercises',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  )),
                     const Text('Set-3'),
                      SizedBox(
              height: media.height * 0.02,
            ),
                ],
              ),
            ),
         
           
           SizedBox(
            height: media.height*0.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                   WorkoutList(
                imageUrl: 'assets/img/squatup.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/squat.gif',
                              initialCounter: 30)));
                },
                title: 'Squat-Ups',
                subtitle: '15x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
            ),
            WorkoutList(
                imageUrl: 'assets/img/splitsquat.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/split-squat.gif',
                              initialCounter: 30)));
                },
                title: 'Split Squats',
                subtitle: '15x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
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
                imageUrl: 'assets/img/calfraise.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/calfraise.gif',
                              initialCounter: 30)));
                },
                title: 'Calf Raise',
                subtitle: '15x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
            ),
            WorkoutList(
                imageUrl: 'assets/img/jumpsquat.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/jump-squat.gif',
                              initialCounter: 30)));
                },
                title: 'Jump Squat',
                subtitle: '12x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
            ),
            WorkoutList(
                imageUrl: 'assets/img/wallsit.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/wall-sit.gif',
                              initialCounter: 30)));
                },
                title: 'Wall Sit ',
                subtitle: '15x',
                trailingimageUrl: iconImage),
                ],
              ),
            ),
           ),
            const Spacer(),
            Container(
              padding:const EdgeInsets.only(bottom: 20),
              child: Center(
                child: RoundButton(
                 
                  
                    title: 'Finish Workout ',
                    onPressed: () async{
                                 DateTime now = DateTime.now();
        String formattedDate = DateFormat('dd MMM yyyy').format(now);

        await addWorkoutHistory(
          todayhistory: WorkoutHistory(
            id: formattedDate,
            dailyWokout: 'Completed lower body exercises',
          ),
        );
          
                        
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const CompletedWorkout()));
                    },
                    buttonColor: Tcolo.Primarycolor1,
                    textColor: Tcolo.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
