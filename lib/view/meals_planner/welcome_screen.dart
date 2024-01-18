import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/round_button_1.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class mealsPlannerWelcome extends StatelessWidget {
  const mealsPlannerWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Tcolo.white,
            )),
        backgroundColor: Tcolo.Primarycolor2,
        title: Center(
            child: Text(
          'Plan Your Meals',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Tcolo.white),
        )),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: media.height * 0.4,
                  child: Center(
                      child: Image.asset('assets/img/meals wecome.png'))),
              const Text(
                  '"Plan your meals with precision, fueling your body with the nutrients it needs for optimal performance and recovery, paving the way to your fitness goals."'),
              const Spacer(),
              RoundButton(
             
                  title: 'Set Now',
                  onPressed: () {},
                  buttonColor: Tcolo.Primarycolor1,
                  textColor: Tcolo.white)
            ],
          )),
    );
  }
}
