import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/common_text_styles.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/view/home/home_page.dart';
import 'package:brofit/view/home/plan_workout/data_base_functions.dart';
import 'package:brofit/view/home/plan_workout/data_model.dart';
import 'package:brofit/view/home/plan_workout/edit_plan.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class PlanDetailsPage extends StatelessWidget {
  final WorkoutPlan details;

  const PlanDetailsPage({super.key, required this.details});

  // String formatTime(BuildContext context, String timeString) {
  //   final timeList = timeString.split(':');
  //   final int hour = int.parse(timeList[0]);
  //   final int minute = int.parse(timeList[1]);
  //   final TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minute);

  //   return timeOfDay.format(context);
  // }
String formatTime(BuildContext context, String timeString) {
  final timeList = timeString.split(':');

  if (timeList.length == 2) {
    
    final int hour = int.parse(timeList[0].replaceAll(RegExp('^0+'), ''));
    final int minute = int.parse(timeList[1].replaceAll(RegExp('^0+'), ''));
    final TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minute);

    return timeOfDay.format(context);
  } else {
   
    if (kDebugMode) {
      print('Invalid time format: $timeString');
    }
    return timeString; 
  }
}

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolo.Primarycolor2,
        title: const Text('Plan Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/img/plan1.png',
              height: media.height * 0.3,
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildDetailsItem('Name', details.name),
                  _buildDetailsItem('Daily WakeUp Time',
                      // formatTime(context, details.dailyWakeUpTime)
                      details.dailyWakeUpTime
                      ),
                       _buildDetailsItem('Daily Wokout Time',
                      // formatTime(context, details.dailyWorkoutTime)
                      details.dailyWorkoutTime
                      ),
                  _buildDetailsItem('Daily Breakfast Time',
                      // formatTime(context, details.dailyBreakfastTime)
                      details.dailyBreakfastTime
                      ),
                  _buildDetailsItem('Daily Lunch Time',
                      // formatTime(context, details.dailyLunchTime)
                      details.dailyLunchTime
                      ),
                  _buildDetailsItem('Daily Dinner Time',
                      // formatTime(context, details.dailyDinnerTime)
                      details.dailyDinnerTime
                      ),
                  _buildDetailsItem('Daily Bed Time',
                      // formatTime(context, details.dailyBedTime)
                      details.dailyBedTime
                      ),
                  SizedBox(
                    height: media.height * 0.2,
                  ),
                ],
              ),
            ),
            RoundButton(
                title: 'Edit Plan',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const EditWorkoutPlan()));
                },
                buttonColor: Tcolo.Primarycolor2,
                textColor: Tcolo.white)
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.loginHeading1),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
              'This will delete the workout plan. Do you want to proceed?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteplan(workout: finaldatas[0]);
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx2) => const HomePage()),
                    (route) => false);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}