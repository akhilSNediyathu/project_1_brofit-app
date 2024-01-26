import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/view/home/home_page.dart';
import 'package:flutter/material.dart';

class DrinkWaterReminder extends StatelessWidget {
  const DrinkWaterReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        backgroundColor: Tcolo.Primarycolor2,
        title: const Text('Set Reminder'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const HomePage()));
        }, icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}