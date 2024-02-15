

import 'package:brofit/database/hive/data_models/add_meals_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
const String mealsDb ='mealsDb';
List <MealPlanner> finalmealslist =[];
addMeals({required MealPlanner meal})async{
   try {
    final datas = await Hive.openBox<MealPlanner>(mealsDb);
    await datas.put(meal.id, meal);
   await addmealstoList();
    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}

Future<List<MealPlanner>> getmeals()async{
  final mealdatas = await Hive.openBox<MealPlanner>(mealsDb);
  if (kDebugMode) {
    print(mealdatas.values);
  }
  return mealdatas.values.toList();
}
addmealstoList()async{
  finalmealslist.clear();
  final mealdatas = await getmeals();
  finalmealslist = List.from(mealdatas);

}
deleteCustomMeals({required MealPlanner meal})async{
  final mealdatas = await Hive.openBox<MealPlanner>(mealsDb);
  await mealdatas.delete(meal.id);
  await addmealstoList();

}