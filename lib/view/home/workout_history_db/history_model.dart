import 'package:hive_flutter/adapters.dart';
 part 'history_model.g.dart';

@HiveType(typeId: 5)
class WorkoutHistory {
  @HiveField(0)
  final String id;
   @HiveField(1)
  final String dailyWokout;

  WorkoutHistory({required this.id, required this.dailyWokout});

}