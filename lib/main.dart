import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/firebase_options.dart';
import 'package:brofit/local_notification.dart';
import 'package:brofit/splash_screen.dart';
import 'package:brofit/view/home/plan_workout/data_base_functions.dart';
import 'package:brofit/view/home/plan_workout/data_model.dart';
import 'package:brofit/view/home/profile_view/drink_water_reminder/datamodel2.dart';
import 'package:brofit/view/home/profile_view/functions_of_reminder.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:timezone/data/latest.dart' as tz;




import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  tz.initializeTimeZones();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(WorkoutPlanAdapter().typeId)) {
    Hive.registerAdapter(WorkoutPlanAdapter());
  }
  if (!Hive.isAdapterRegistered(ReminderModelAdapter().typeId)) {
    Hive.registerAdapter(ReminderModelAdapter());
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  addToList();
  addReminderToList();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brofit',
      theme: ThemeData(
          
          primaryColor: Tcolo.Primarycolor1,
          useMaterial3: true,
          fontFamily: "Poppins"),
       home: const Splash(),
      // home: CompleteProfileView(),
      
      debugShowCheckedModeBanner: false,
    );
  }
}
