import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common/home_screenlist_tile.dart';
import 'package:brofit/presentation/common_widget/homefloating.dart';
import 'package:brofit/presentation/view/home/chest_workout/set1_chestworkout.dart';
import 'package:brofit/presentation/view/home/leg_workout/set1_legworkout.dart';
import 'package:brofit/presentation/view/home/profile_view/heartbpmrate/heart_rate.dart';
import 'package:brofit/presentation/view/home/sixpack_workout/set1_sixpack_workout.dart';
import 'package:brofit/presentation/view/home/total_arm_toning/set1.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  @override
  Widget build(BuildContext context) {
    

    var media = MediaQuery.of(context).size;

    return Scaffold(
   
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Tcolo.black,
            image: const DecorationImage(
                image: AssetImage('assets/img/homebg.jpeg'),
                fit: BoxFit.cover,
                opacity: 0.5)),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            homeList(
                imageUrl: 'assets/img/listTile1.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const TotalArmToning()));
                },
                title: 'Total Arm Toning'),
            SizedBox(
              height: media.width * 0.04,
            ),
            homeList(
                imageUrl: 'assets/img/listTile2.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const ChestWorkoutSet1()));
                },
                title: 'Chisel Your Chest'),
            SizedBox(
              height: media.width * 0.04,
            ),
            homeList(
                imageUrl: 'assets/img/listTile3.png',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const SixpackSet1()));
                },
                title: 'Six-Pack Sprint'),
            SizedBox(
              height: media.width * 0.04,
            ),
            homeList(
                imageUrl: 'assets/img/listTile4.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const LegWorkoutSet1()));
                },
                title: 'Legendary Leg Lifts'),
          ],
        ),
      ),
      floatingActionButton: GradientFab(onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const HeartRate()));

      }),
    );
  }
}
