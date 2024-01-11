import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:fitness_app/splashScreen.dart';
import 'package:fitness_app/view/login/complete_profile.dart';
import 'package:fitness_app/view/login/signup_view.dart';
import 'package:fitness_app/view/on_boarding_screeens/started_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Brofit',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
       primaryColor: Tcolo.Primarycolor1,
        useMaterial3: true,
        fontFamily: "Poppins"
      ),
      home:Splash() ,
      debugShowCheckedModeBanner: false,
    );
  }
}

