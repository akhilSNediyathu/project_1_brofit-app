
import 'package:brofit/database/hive/data_models/plan_meals_data_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String planMealsDb ='planMealsDb';
List <SetMealsPlan> finalselectedmeals =[];
addMealsPlan({required SetMealsPlan mealplan})async{
try {
    final datas = await Hive.openBox<SetMealsPlan>(planMealsDb);
    await datas.put(mealplan.id,mealplan );
   await addPlanToList();
    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}
Future <List<SetMealsPlan>> getMealsPlan()async{
  final selectedmeals = await Hive.openBox<SetMealsPlan>(planMealsDb);
  if (kDebugMode) {
    print(selectedmeals.values);
  }
  return selectedmeals.values.toList();

}
addPlanToList ()async{
  finalselectedmeals.clear();
  final mealsplan = await getMealsPlan();
  finalselectedmeals = List.from(mealsplan);

}
deletePlannedMeals({required SetMealsPlan mealplan})async{
  final selectedmeals = await Hive.openBox<SetMealsPlan>(planMealsDb);
  await selectedmeals.delete(mealplan.id);
  await addPlanToList();
}