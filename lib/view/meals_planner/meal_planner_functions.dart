
import 'package:brofit/view/meals_planner/plan_meals_data_mosel.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
const String mealsDb ='mealsDb';
List <MealPlanner> finalmealslist =[];
addMeals({required MealPlanner meal})async{
   try {
    final datas = await Hive.openBox<MealPlanner>(mealsDb);
    await datas.put(meal.id, meal);
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