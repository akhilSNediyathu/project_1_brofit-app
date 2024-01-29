
import 'package:brofit/view/home/profile_view/drink_water_reminder/datamodel2.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
const String reminderdb = 'remonderdb';
List <ReminderModel> reminder =[];
Future<void> addreminderDatas({required ReminderModel reminder}) async {
  try {
    final datas = await Hive.openBox<ReminderModel>(reminderdb);
    await datas.put(reminder.id,reminder);
   await addReminderToList();
    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}

Future<List<ReminderModel>>getRemiderDatas() async {

    final datas = await Hive.openBox<ReminderModel>(reminderdb);
    
    return datas.values.toList();
}
addReminderToList()async{
 final notireminder = await getRemiderDatas();
 reminder.clear();
 reminder = List.from(notireminder);
  
} 
deletereminder({required String id})async{
  final datas = await Hive.openBox<ReminderModel>(reminderdb);
  datas.delete(id);
 await addReminderToList();
}
