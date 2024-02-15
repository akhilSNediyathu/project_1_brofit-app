import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common/testgif.dart';
import 'package:brofit/presentation/common/workout_list.dart';
import 'package:brofit/presentation/common_widget/round_button_1.dart';
import 'package:brofit/presentation/view/home/sixpack_workout/set3_sixpack_workout.dart';


import 'package:flutter/material.dart';

class SixPackSet2 extends StatelessWidget {
  const SixPackSet2({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const String iconImage = 'assets/img/Icon-Next.png';

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
                const Text(
                    "Awesome! Two sets down, one to go. Finish strong and conquer the challenge!"),
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
                  const SixpackSet3()), 
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Abdominal toning',
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
            Container(color: Tcolo.white,
            padding:const EdgeInsets.only(top:10),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                child: Text(
              'Exercises',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
            const Text('Set-2'),
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
                imageUrl: 'assets/img/planktap.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/plank tap.gif',
                              initialCounter: 30)));
                },
                title: 'Plank -Tap',
                subtitle: '00:30',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
            ),
            WorkoutList(
                imageUrl: 'assets/img/plank.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/plank.gif',
                              initialCounter: 30)));
                },
                title: 'Plank',
                subtitle: '00:30',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
            ),
            WorkoutList(
                imageUrl: 'assets/img/mountainclimp.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/mountain climb.gif',
                              initialCounter: 30)));
                },
                title: 'Mountain Climb',
                subtitle: '00:30',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
            ),
            WorkoutList(
                imageUrl: 'assets/img/halfsitups.png',
                onIconTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/halfcrunch.gif',
                              initialCounter: 30)));
                },
                title: 'Half Sit-Ups',
                subtitle: '15x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
            ),
            WorkoutList(
                imageUrl: 'assets/img/russiantwist.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/russiantwist.gif',
                              initialCounter: 30)));
                },
                title: 'Russian Twist',
                subtitle: '15x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
            ),
            WorkoutList(
                imageUrl: 'assets/img/bycyclecrunch.png',
                onIconTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomCounterDialog1(
                              gifPath: 'assets/gif/bicycle-crunches.gif',
                              initialCounter: 30)));
                },
                title: 'Bicycle Crunch',
                subtitle: '15x',
                trailingimageUrl: iconImage),
                ],
              ),
            ),
           ),
            const Spacer(),
            RoundButton(
          
                title: 'Set-3 ',
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
