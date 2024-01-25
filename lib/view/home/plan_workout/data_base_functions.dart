

import 'package:brofit/view/home/plan_workout/data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String workoutPlanDb = 'workoutPlanDb';
List <WorkoutPlan> finaldatas = [];

Future<void> addDatas({required WorkoutPlan workout}) async {
  try {
    final datas = await Hive.openBox<WorkoutPlan>(workoutPlanDb);
    await datas.put(workout.id, workout);
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