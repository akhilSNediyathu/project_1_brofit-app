import 'package:hive_flutter/hive_flutter.dart';
part 'plan_meals_data_mode.g.dart';
@HiveType(typeId: 4)
class SetMealsPlan {

@HiveField(0)
final String id;

 @HiveField(1)
final  List <String> mealPlan;

 @HiveField(2)
 final String calorie;

  SetMealsPlan({required this.id, required this.mealPlan,required this.calorie});

}