import 'package:brofit/presentation/utils/colo_extension.dart';
import 'package:brofit/presentation/utils/common_text_styles.dart';
import 'package:brofit/presentation/utils/testgif.dart';
import 'package:brofit/presentation/utils/workout_list.dart';
import 'package:brofit/presentation/common_widget/round_button_1.dart';
import 'package:brofit/presentation/view/home/chest_workout/set2_chestworkout.dart';


import 'package:flutter/material.dart';



class ChestWorkoutSet1 extends StatelessWidget {
  const ChestWorkoutSet1({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const String iconImage = 'assets/img/Icon-Next.png';

    void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text('Congratulations!',style: AppTextStyles.new1,),
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
                 Text(
                    "Great work! You've crushed your first set. Now, conquer the next two and own the full three-set challenge!",style: AppTextStyles.loginEnding),
              ],
            ),
          );
        },
      );

      // Delay for 3 seconds before navigating to another page
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const   ChestWorkoutSet2()), // Replace with your target page
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Comprehensive Chest Routine',
          style: AppTextStyles.workouAppBarTitle,
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
          Container(color: Tcolo.white,
          padding:const EdgeInsets.only(top:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Center(
                child: Text(
              'Exercises',
              style: AppTextStyles.exercises,
            )),
             Text('set-1',style: AppTextStyles.loginEnding,),
            SizedBox(
              height: media.height * 0.02,
            ),
            ],
          ),
          ),
          SizedBox(
            height: media.height*.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                    WorkoutList(
                imageUrl: 'assets/img/warmup.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/karlie-stretch-5.gif',
                              initialCounter: 300)));
                },
                title: 'Warm Up',
                subtitle: '05:00',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
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
              height: media.height * 0.01,
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
              height: media.height * 0.01,
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
              height: media.height * 0.01,
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
                ],
              ),
            ),
          ),
            const Spacer(),
            RoundButton(
              
                title: 'Set-2 ',
                onPressed: () {
                  showCustomDialog(context);
                },
                buttonColor: Tcolo.Primarycolor1,
                textColor: Tcolo.white)
          ],
        ),
      ),
    );
  }
}
