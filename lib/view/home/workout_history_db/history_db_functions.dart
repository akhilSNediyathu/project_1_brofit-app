import 'package:brofit/view/home/workout_history_db/history_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

const String historyDb = 'historyDb';

List<WorkoutHistory> finalWorkoutHistory = [];

addWorkoutHistory({required WorkoutHistory todayhistory}) async {
  try {
    final history = await Hive.openBox<WorkoutHistory>(historyDb);
    await history.put(todayhistory.id, todayhistory);
    await addHistorytoList();

    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}

Future<List<WorkoutHistory>> getHistory() async {
  final history = await Hive.openBox<WorkoutHistory>(historyDb);
  if (kDebugMode) {
    print(history.values);
  }
  return history.values.toList();
}

addHistorytoList() async {
  finalWorkoutHistory.clear();
  final workoutHistory = await getHistory();
  finalWorkoutHistory = List.from(workoutHistory);
}

deleteHistory({required WorkoutHistory todayhistory}) async {
  final history = await Hive.openBox<WorkoutHistory>(historyDb);
  await history.delete(todayhistory.id);
  await addHistorytoList();
  await history.close(); // Close the box after use.
}
