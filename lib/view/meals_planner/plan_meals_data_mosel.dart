import 'package:hive_flutter/hive_flutter.dart';
part 'plan_meals_data_mosel.g.dart';
@HiveType(typeId: 3)
class MealPlanner{
  @HiveField(0)
  final String id;
  @HiveField(1)
 final Map <String, num> mealList;

  MealPlanner( {required this.mealList,required this.id});
}