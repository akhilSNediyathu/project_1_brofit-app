// ignore_for_file: use_build_context_synchronously

import 'package:brofit/presentation/common_widget/custom_show_dialogues.dart';
import 'package:brofit/database/hive/functions/plan_meals_db_functions.dart';
import 'package:brofit/presentation/view/meals_planner/welcome_screen.dart';
import 'package:flutter/material.dart';

 void showDeleteConfirmationDialogPlannedMeal(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async{
             await deletePlannedMeals(mealplan: finalselectedmeals[0]);
              showCustomDialogDone(context, 'assets/gif/deletedone3.json');
      await Future.delayed(const Duration(seconds: 2));
       Navigator.pop(context);
              Navigator.of(context).pop(); 
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> const MealsPlannerWelcome()));
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}