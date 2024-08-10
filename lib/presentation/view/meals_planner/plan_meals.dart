// ignore_for_file: use_build_context_synchronously

import 'package:brofit/presentation/utils/colo_extension.dart';
import 'package:brofit/presentation/utils/common_text_styles.dart';
import 'package:brofit/presentation/common_widget/custom_show_dialogues.dart';
import 'package:brofit/presentation/common_widget/round_button_1.dart';
import 'package:brofit/database/hive/functions/plan_meals_db_functions.dart';
import 'package:brofit/presentation/view/meals_planner/welcome_screen.dart';


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../database/hive/functions/add_custom_meals_fn.dart';
import 'add_meals_showdialogue.dart';
import 'custom_meals_list.dart';
import '../../../database/hive/data_models/plan_meals_data_mode.dart';

class PlanMeals extends StatefulWidget {
  const PlanMeals({Key? key}) : super(key: key);

  @override
  State<PlanMeals> createState() => _PlanMealsState();
}

class _PlanMealsState extends State<PlanMeals> {
  // Sample data for food items with calories
  final Map<String, num> breakfastItems = {'Oatmeal': 150, 'Eggs': 200, 'Smoothie': 100};
  final Map<String, num> lunchItems = {'Salad': 120, 'Sandwich': 300, 'Soup': 150};
  final Map<String, num> dinnerItems = {'Grilled Chicken': 250, 'Pasta': 400, 'Stir-fry': 300};

  // Selected values
  String? selectedBreakfast;
  String? selectedLunch;
  String? selectedDinner;

  // Calorie limits
  final int dailyCalorieLimit = 2000; 
  @override
  void initState() {
  for(int i = 0; i<finalmealslist.length;i++){
    breakfastItems.addAll(finalmealslist[i].mealList);
    lunchItems.addAll(finalmealslist[i].mealList);
    dinnerItems.addAll(finalmealslist[i].mealList);
  }
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        title: const Text('Plan Your Meals'),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomMealsList()));
        }, icon: const Icon(Icons.restaurant_menu))],
      ),
      body: Container(
        padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: media.height*0.2,
                child: Lottie.asset('assets/gif/addfoodplan.json',fit: BoxFit.contain)),
              buildMealCard('Breakfast', breakfastItems.keys.toList(), selectedBreakfast),
              buildMealCard('Lunch', lunchItems.keys.toList(), selectedLunch),
              buildMealCard('Dinner', dinnerItems.keys.toList(), selectedDinner),
              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(onPressed: (){
                                                   showAddFoodDialog(context);
                                    } , child: Text('+Add More Dishes',style: AppTextStyles.loginEnding,)),
                                  ],
                                ),
              Text('Total Calories: ${calculateTotalCalories()}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                            if (calculateTotalCalories() > dailyCalorieLimit)
                              const Text(
                                'Warning: Exceeding Daily Calorie Limit!',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                                
                              ),
                              
                                
          
               
            
             
                SizedBox(height: media.height*0.04,),
                 RoundButton(title: 'Set Meals plan', onPressed: ()async{
                    if (selectedBreakfast == null || selectedLunch == null || selectedDinner == null) {
                 
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Validation Error'),
                content: const Text('Please select a meal for each category before setting the meal plan.'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
                } else {
          num totalCalories = calculateTotalCalories();
                await  addMealsPlan(mealplan: SetMealsPlan(id: 'MealsPlan', mealPlan: [selectedBreakfast!,selectedLunch!,selectedDinner!], calorie:totalCalories.toString() ));
                showCustomDialogDone(context, 'assets/gif/done.json');
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);
           Navigator.pop(context);
           Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const MealsPlannerWelcome()));
          
           
                 
                }
          
                }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white)
              
               
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String hint, List<String> items, String? value, Function(dynamic)? onChanged) {
    return DropdownButton(
      hint: Text(hint),
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget buildMealCard(String mealType, List<String> items, String? selectedValue) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose $mealType',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildDropdown('Select $mealType', items, selectedValue, (value) {
              setState(() {
                if (mealType == 'Breakfast') {
                  selectedBreakfast = value as String?;
                } else if (mealType == 'Lunch') {
                  selectedLunch = value as String?;
                } else if (mealType == 'Dinner') {
                  selectedDinner = value as String?;
                }
              });
            }),
            const SizedBox(height: 10),
            Text(
              'Selected $mealType: ${selectedValue ?? ''} - Calories: ${calculateCalories(mealType, selectedValue)}',
              style: const TextStyle(fontSize: 16),
            ),
            
          ],
        ),
      ),
    );
  }

  num calculateCalories(String mealType, String? selectedValue) {
    Map<String, num> selectedItems = mealType == 'Breakfast'
        ? breakfastItems
        : mealType == 'Lunch'
            ? lunchItems
            : dinnerItems;

    return selectedValue != null ? selectedItems[selectedValue] ?? 0 : 0;
  }

  num calculateTotalCalories() {
    num breakfastCalories = breakfastItems[selectedBreakfast ?? ''] ?? 0;
    num lunchCalories = lunchItems[selectedLunch ?? ''] ?? 0;
    num dinnerCalories = dinnerItems[selectedDinner ?? ''] ?? 0;

    return breakfastCalories + lunchCalories + dinnerCalories;
  }
 


}
