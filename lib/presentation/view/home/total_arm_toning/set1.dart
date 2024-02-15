import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common/testgif.dart';
import 'package:brofit/presentation/common/workout_list.dart';
import 'package:brofit/presentation/common_widget/round_button_1.dart';
import 'package:brofit/presentation/view/home/total_arm_toning/set2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TotalArmToning extends StatelessWidget {
  const TotalArmToning({super.key});

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
                    "Great work! You've crushed your first set. Now, conquer the next two and own the full three-set challenge!"),
              ],
            ),
          );
        },
      );

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const TotalArmToningSet2()), 
        );
      });
    }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:const EdgeInsets.only(top:10),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                child: Text(
              'Exercises',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
            const Text('set-1'),
            SizedBox(
              height: media.height * 0.02,
            ),
              ],
             ), 
            ),
          SizedBox(height: media.height*0.64,
          child: SingleChildScrollView(
            child: Column(
              children: [
                  WorkoutList(
                imageUrl: 'assets/img/warmup.png',
                onIconTap: () {
                  HapticFeedback.mediumImpact();
                  
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
              height: media.height * 0.01,
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
              height: media.height * 0.01,
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
                subtitle: '15x',
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
                              gifPath: 'assets/gif/damond pushup.gif',
                              initialCounter: 30))
                              );
                },
                title: 'Diamond Push-Ups',
                subtitle: '12x',
                trailingimageUrl: iconImage),
            SizedBox(
              height: media.height * 0.01,
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
