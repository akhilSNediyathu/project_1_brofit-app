import 'package:hive_flutter/hive_flutter.dart';
part 'datamodel2.g.dart';

@HiveType(typeId: 2)
class ReminderModel{
  @HiveField(0)
 final  String id;
  @HiveField(1)
 final String status;

  ReminderModel({required this.id, required this.status});




 
}