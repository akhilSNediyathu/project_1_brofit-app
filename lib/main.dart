import 'package:brofit/database/hive/workout_history_db/history_db_functions.dart';
import 'package:brofit/database/hive/workout_history_db/history_model.dart';
import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/database/firebase/firebase_options.dart';
import 'package:brofit/local_notifications/local_notification.dart';
import 'package:brofit/database/hive/functions/data_base_functions.dart';
import 'package:brofit/database/hive/data_models/data_model.dart';
import 'package:brofit/presentation/view/home/profile_view/drink_water_reminder/datamodel2.dart';

import 'package:brofit/database/hive/functions/add_custom_meals_fn.dart';

import 'package:brofit/database/hive/data_models/plan_meals_data_mode.dart';
import 'package:brofit/database/hive/data_models/add_meals_data_model.dart';

import 'package:brofit/database/hive/functions/plan_meals_db_functions.dart';
import 'package:brofit/presentation/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:timezone/data/latest.dart' as tz;

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'database/hive/functions/functions_of_reminder.dart';




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
  if (!Hive.isAdapterRegistered(MealPlannerAdapter().typeId)) {
    Hive.registerAdapter(MealPlannerAdapter());
  }
  if (!Hive.isAdapterRegistered(SetMealsPlanAdapter().typeId)) {
    Hive.registerAdapter(SetMealsPlanAdapter());
  }
   if (!Hive.isAdapterRegistered(WorkoutHistoryAdapter().typeId)) {
    Hive.registerAdapter(WorkoutHistoryAdapter());
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  addToList();
  addmealstoList();
  addReminderToList();
  addPlanToList();
  addHistorytoList();

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
    

      debugShowCheckedModeBanner: false,
    );
  }
}
