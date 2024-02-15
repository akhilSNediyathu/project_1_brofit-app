
import 'package:brofit/database/hive/data_models/data_model.dart';
import 'package:brofit/database/hive/functions/plan_meals_db_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String workoutPlanDb = 'workoutPlanDb';
List <WorkoutPlan> finaldatas = [];

Future<void> addDatas({required WorkoutPlan workout}) async {
  try {
    final datas = await Hive.openBox<WorkoutPlan>(workoutPlanDb);
    await datas.put(workout.id, workout);
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

Future<List<WorkoutPlan>>getDatas() async {

    final datas = await Hive.openBox<WorkoutPlan>(workoutPlanDb);
    
    return datas.values.toList();
}
addToList()async{
 final dataList = await getDatas();
 finaldatas.clear();
 finaldatas = List.from(dataList);
 
}
deleteplan({required WorkoutPlan workout})async{
  
    final datas = await Hive.openBox<WorkoutPlan>(workoutPlanDb);
  await datas.delete(workout.id);
  await addToList();
}