import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/view/meals_planner/plan_meals.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class MealsPlannerWelcome extends StatefulWidget {
  const MealsPlannerWelcome({super.key});

  @override
  State<MealsPlannerWelcome> createState() => _MealsPlannerWelcomeState();
}

class _MealsPlannerWelcomeState extends State<MealsPlannerWelcome> {
  //  User? _user;
  //  String? _userName;
 
  // Future<void> _loadUserData() async {
 
  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (user != null) {
     
  //     DocumentSnapshot userData = await FirebaseFirestore.instance
  //         .collection('UserDetails')
  //         .doc(user.email) 
  //         .get();

    
  //     String userName = userData['Name'];
  //     int userhieght = int.parse(userData['height']);

  //     setState(() {
  //       _user = user;
  //       _userName = userName;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Tcolo.white,
            )),
        backgroundColor: Tcolo.Primarycolor2,
        title: Center(
            child: Text(
          'Plan Your Meals',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Tcolo.white),
        )),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: media.height * 0.4,
                  child: Center(
                      child: Image.asset('assets/img/meals wecome.png'))),
              const Text(
                  '"Plan your meals with precision, fueling your body with the nutrients it needs for optimal performance and recovery, paving the way to your fitness goals."'),
              const Spacer(),
              RoundButton(
             
                  title: 'Set Now',
                  onPressed: () {
                    Navigator.push(context, (MaterialPageRoute(builder: (ctx)=>const PlanMeals())));
                  },
                  buttonColor: Tcolo.Primarycolor1,
                  textColor: Tcolo.white)
            ],
          )),
    );
  }
}
