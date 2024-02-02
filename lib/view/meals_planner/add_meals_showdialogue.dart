import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common_widget/round_textfield.dart';
import 'package:brofit/view/meals_planner/meal_planner_functions.dart';
import 'package:brofit/view/meals_planner/plan_meals.dart';
import 'package:brofit/view/meals_planner/plan_meals_data_mosel.dart';
import 'package:flutter/material.dart';

void showAddFoodDialog(BuildContext context) {
  var media = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController();
    TextEditingController calorieController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Tcolo.white,
          title: const Text('Add Food'),
          content: SizedBox(
            height: media.height*0.2,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
              
                  RoundTextField(
                    hintText: 'Food Name',
                    
                     icon: 'assets/img/fooditem (1).png',
                      controller: nameController,
                       validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid food name';
                    }
                    return null;
                  },
                      ),
                 SizedBox(height: media.height*0.02,),
                  RoundTextField(hintText: 'Calories' , icon:'assets/img/weight-scale 1.png',controller: calorieController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid calorie value';
                    }
                    int calorie = int.tryParse(value) ?? 0;
                    if (calorie <= 0 || calorie > 1000) {
                      return 'Calories must be between 1 and 1000';
                    }
                    return null;
                  },
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
             onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Save the food with entered details
                addMeals(
                  meal: MealPlanner(
                    mealList: {nameController.text: num.parse(calorieController.text)},
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                  ),
                );
                addmealstoList();
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const PlanMeals())); // Close the dialog
              }
            },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }