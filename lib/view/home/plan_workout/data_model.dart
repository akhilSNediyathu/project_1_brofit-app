
import 'package:hive_flutter/adapters.dart';

 part 'data_model.g.dart';



@HiveType(typeId: 0)
class WorkoutPlan {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String dailyWorkoutTime;

  @HiveField(2)
  final String dailyWakeUpTime;

  @HiveField(3)
  final String dailyBreakfastTime;

  @HiveField(4)
  final String dailyLunchTime;

  @HiveField(5)
  final String dailyDinnerTime;

  @HiveField(6)
  final String dailyBedTime;

  @HiveField(7)
  final String name;

  WorkoutPlan({
    required this.name,
    required this.dailyWorkoutTime,
    required this.dailyWakeUpTime,
    required this.dailyBreakfastTime,
    required this.dailyLunchTime,
    required this.dailyDinnerTime,
    required this.dailyBedTime,
    required this.id,
  });
}