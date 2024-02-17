// ignore_for_file: use_build_context_synchronously

import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common_widget/round_textfield.dart';
import 'package:brofit/database/hive/functions/add_custom_meals_fn.dart';
import 'package:brofit/database/hive/data_models/add_meals_data_model.dart';
import 'package:brofit/presentation/view/meals_planner/plan_meals.dart';
import 'package:flutter/material.dart';

void showAddFoodDialog(BuildContext context) {
  var media = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController();
    TextEditingController calorieController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Tcolo.white,
          surfaceTintColor: Tcolo.white,
        
          title: const Text('Add Food'),
          content: SizedBox(
            height: media.height*0.2,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
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
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
             onPressed: ()async{
              if (formKey.currentState?.validate() ?? false) {
              
               await addMeals(
                  meal: MealPlanner(
                    mealList: {nameController.text: num.parse(calorieController.text)},
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                  ),
                );
              
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const PlanMeals())); 
              }
            },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }