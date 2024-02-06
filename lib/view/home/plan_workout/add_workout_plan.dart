import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/time_setter.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/common_widget/round_textfield.dart';
import 'package:brofit/local_notification.dart';
import 'package:brofit/view/home/home_page.dart';
import 'package:brofit/view/home/plan_workout/data_base_functions.dart';
import 'package:brofit/view/home/plan_workout/data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddWorkoutPlan extends StatefulWidget {
  const AddWorkoutPlan({Key? key}) : super(key: key);

  @override
  State<AddWorkoutPlan> createState() => _AddWorkoutPlanState();
}

class _AddWorkoutPlanState extends State<AddWorkoutPlan> {
  TextEditingController nameController = TextEditingController();
  TimeOfDay? _selectedDailyWorkoutTime;
  TimeOfDay? _selectedDailyWakeTime;
  TimeOfDay? _selectedDailyBreakfastTime;
  TimeOfDay? _selectedDailyLunchTime;
  TimeOfDay? _selectedDailyDinnerTime;
  TimeOfDay? _selectedDailyBedTime;
  List<int> selectedDays = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        title: const Text('Add Schedule'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundTextField(
                hintText: 'Name your plan',
                icon: 'assets/img/plan.png',
                controller: nameController,
              ),
              SizedBox(height: media.height * 0.02),
              const Text('Details'),
              SizedBox(height: media.height * 0.02),
              GestureDetector(
                onTap: () {
                  _selectTimeForDailyWorkout(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily Workout time : ${_selectedDailyWorkoutTime != null ? formatTimeOfDay(_selectedDailyWorkoutTime!) : '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDailyWakeUp(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily WakeUp time : ${_selectedDailyWakeTime != null ? formatTimeOfDay(_selectedDailyWakeTime!) : '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDailBreakFast(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily breakfast time : ${_selectedDailyBreakfastTime != null ? formatTimeOfDay(_selectedDailyBreakfastTime!) : '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDailLunch(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily Lunch time :${_selectedDailyLunchTime != null ? formatTimeOfDay(_selectedDailyLunchTime!) : '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDinner(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily Dinner time : ${_selectedDailyDinnerTime != null ? formatTimeOfDay(_selectedDailyDinnerTime!) : '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForBed(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily Bed time :${_selectedDailyBedTime != null ? formatTimeOfDay(_selectedDailyBedTime!) : '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.05),
              RoundButton(
                title: 'Save',
                onPressed: () async {
                  if (_selectedDailyWorkoutTime == null ||
                      _selectedDailyWakeTime == null ||
                      _selectedDailyBreakfastTime == null ||
                      _selectedDailyLunchTime == null ||
                      _selectedDailyDinnerTime == null ||
                      _selectedDailyBedTime == null ||
                      nameController.text.isEmpty) {
                    showValidationError();
                    return;
                  } else {
                    await addDatas(
                        workout: WorkoutPlan(
                      name: nameController.text,
                      dailyWorkoutTime: formatTimeOfDay(
                        _selectedDailyWorkoutTime!,
                      ),
                      dailyWakeUpTime: formatTimeOfDay(_selectedDailyWakeTime!),
                      dailyBreakfastTime:
                          formatTimeOfDay(_selectedDailyBreakfastTime!),
                      dailyLunchTime: formatTimeOfDay(_selectedDailyLunchTime!),
                      dailyDinnerTime:
                          formatTimeOfDay(_selectedDailyDinnerTime!),
                      dailyBedTime: formatTimeOfDay(_selectedDailyBedTime!),
                      id: 'plan',
                    ));
                    await getDatas();
                    addToList();
                    LocalNotifications.scheduleNotification(
                        title: 'Daily Workout Reminder',
                        body:
                            'It\'s time for your daily workout! Stay active and healthy.',
                        payload: 'daily_workout_reminder',
                        scheduledTime: _selectedDailyWorkoutTime!,
                        daysOfWeek: selectedDays);
                    LocalNotifications.scheduleNotification(
                        title: 'Daily Wake-Up Reminder',
                        body:
                            'Rise and shine! It\'s time to start your day with energy and positivity. Seize the morning and embrace a new day filled with possibilities.',
                        payload: 'daily_wake_up_reminder',
                        scheduledTime: _selectedDailyWakeTime!,
                        daysOfWeek: selectedDays);
                    LocalNotifications.scheduleNotification(
                        title: 'Breakfast Time Reminder',
                        body:
                            'Good morning! It\'s time to fuel your day with a nutritious breakfast. Make it delicious and energizing!',
                        payload: 'breakfast_time_reminder',
                        scheduledTime: _selectedDailyBreakfastTime!,
                        daysOfWeek: selectedDays);
                    LocalNotifications.scheduleNotification(
                        title: 'Lunch Reminder',
                        body:
                            'Hey there! It\'s lunchtime. Take a break and enjoy a nourishing meal to refuel your energy for the rest of the day.',
                        payload: 'lunch_time_reminder',
                        scheduledTime: _selectedDailyLunchTime!,
                        daysOfWeek: selectedDays);
                    LocalNotifications.scheduleNotification(
                        title: 'Dinner Reminder',
                        body:
                            'Good evening! It\'s dinner time. Treat yourself to a satisfying and nutritious dinner. Bon appétit!',
                        payload: 'dinner_time_reminder',
                        scheduledTime: _selectedDailyDinnerTime!,
                        daysOfWeek: selectedDays);
                    LocalNotifications.scheduleNotification(
                        title: 'Bedtime Reminder',
                        body:
                            'Good night! It\'s time to wind down and get ready for a restful sleep. Create a peaceful bedtime routine for a rejuvenating night\'s sleep.',
                        payload: 'bedtime_reminder',
                        scheduledTime: _selectedDailyBedTime!,
                        daysOfWeek: selectedDays);
// ignore: use_build_context_synchronously
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx2) => const HomePage()),
                        (route) => false);

                    // ignore: use_build_context_synchronously
                    // ignore: use_build_context_synchronously
                  }
                },
                buttonColor: Tcolo.Primarycolor1,
                textColor: Tcolo.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTimeForDailyWorkout(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedDailyWorkoutTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDailyWorkoutTime = pickedTime;
      });
      if (kDebugMode) {
        print("Selected Time: $_selectedDailyWorkoutTime");
      }
    }
  }

  Future<void> _selectTimeForDailyWakeUp(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedDailyWakeTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDailyWakeTime = pickedTime;
      });
    }
  }

  Future<void> _selectTimeForDailBreakFast(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedDailyWorkoutTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDailyBreakfastTime = pickedTime;
      });
    }
  }

  Future<void> _selectTimeForDailLunch(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedDailyWorkoutTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDailyLunchTime = pickedTime;
      });
    }
  }

  Future<void> _selectTimeForDinner(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedDailyWorkoutTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDailyDinnerTime = pickedTime;
      });
    }
  }

  Future<void> _selectTimeForBed(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedDailyWorkoutTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDailyBedTime = pickedTime;
      });
    }
  }

  void showValidationError() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Set all the Time'),
          content: const Text('Please fill in all fields'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return '${dateTime.hour}:${dateTime.minute}';
  }
}