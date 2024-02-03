import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/common_text_styles.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/view/meals_planner/mealplanner_showdialogues.dart';

import 'package:brofit/view/meals_planner/plan_meals.dart';


import 'package:brofit/view/meals_planner/plan_meals_db_functions.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class MealsPlannerWelcome extends StatefulWidget {
  const MealsPlannerWelcome({super.key});

  @override
  State<MealsPlannerWelcome> createState() => _MealsPlannerWelcomeState();
}

class _MealsPlannerWelcomeState extends State<MealsPlannerWelcome> {
  


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return  finalselectedmeals.isEmpty?Scaffold(
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
                      child: Lottie.asset('assets/gif/planfoodwelcome.json',))),
                      SizedBox(height: media.height*0.02,),
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
    ) :Scaffold(
  appBar: AppBar(
    actions: [IconButton(onPressed: (){
     showDeleteConfirmationDialogPlannedMeal(context);
    }, icon:const  Icon(Icons.delete))],
    title: const Text("Today's Meal Schedule"),
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: Tcolo.Primarycolor2,
  ),
  body: Container(
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/gif/foodplan1.json'),

       
        Text('Breakfast: ${finalselectedmeals[0].mealPlan[0]}', style: AppTextStyles.carousalHeading2TextStyle),
        Text('Lunch: ${finalselectedmeals[0].mealPlan[1]}', style: AppTextStyles.carousalHeading2TextStyle),
        Text('Dinner: ${finalselectedmeals[0].mealPlan[2]}', style: AppTextStyles.carousalHeading2TextStyle),
        
      

       
        Text('Total Calories: ${finalselectedmeals[0].calorie}', style: AppTextStyles.carousalHeading2TextStyle),

        
        const Spacer(),

       
        RoundButton(
          title: 'Edit Plan',
          onPressed: () {
            Navigator.push(context, (MaterialPageRoute(builder: (ctx)=>const PlanMeals())));
          },
          buttonColor: Tcolo.Primarycolor2,
          textColor: Tcolo.white,
        ),
      ],
    ),
  ),
);

  }
}
