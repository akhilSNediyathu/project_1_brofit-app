import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/firebase_options.dart';
import 'package:brofit/splash_screen.dart';
import 'package:brofit/view/home/plan_workout/data_base_functions.dart';
import 'package:brofit/view/home/plan_workout/data_model.dart';
import 'package:firebase_core/firebase_core.dart';




import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(WorkoutPlanAdapter().typeId)) {
    Hive.registerAdapter(WorkoutPlanAdapter());
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  addToList();

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
