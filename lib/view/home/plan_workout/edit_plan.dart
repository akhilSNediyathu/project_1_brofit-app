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

class EditWorkoutPlan extends StatefulWidget {
  const EditWorkoutPlan({super.key});

  @override
  State<EditWorkoutPlan> createState() => _EditWorkoutPlanState();
}

class _EditWorkoutPlanState extends State<EditWorkoutPlan> {
  TextEditingController nameController = TextEditingController();
  WorkoutPlan textdatas = finaldatas[0];
  String name = finaldatas[0].name;

  TimeOfDay? _selectedDailyWorkoutTime;
  TimeOfDay? _selectedDailyWakeTime;
  TimeOfDay? _selectedDailyBreakfastTime;
  TimeOfDay? _selectedDailyLunchTime;
  TimeOfDay? _selectedDailyDinnerTime;
  TimeOfDay? _selectedDailyBedTime;
  List<int> selectedDays = [1, 2, 3, 4, 5, 6, 7];
  late TimeOfDay dailyworkoutTime;
  late TimeOfDay dailyWakeUpTime;
  late TimeOfDay dailyBreakfastTime;
  late TimeOfDay dailyLunchTime;
  late TimeOfDay dailyDinnerTime;
  late TimeOfDay bedTime;

  @override
  void initState() {
    nameController.text = name;
    dailyworkoutTime = stringToTimeOfDay(textdatas.dailyWorkoutTime);
    dailyWakeUpTime = stringToTimeOfDay(textdatas.dailyWakeUpTime);
    dailyBreakfastTime = stringToTimeOfDay(textdatas.dailyBreakfastTime);
    dailyLunchTime = stringToTimeOfDay(textdatas.dailyLunchTime);
    dailyDinnerTime = stringToTimeOfDay(textdatas.dailyDinnerTime);
    bedTime = stringToTimeOfDay(textdatas.dailyBedTime);
    super.initState();
  }

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
                        'Set daily Workout time : ${_selectedDailyWorkoutTime != null ? formatTimeOfDay(_selectedDailyWorkoutTime!) : textdatas.dailyWorkoutTime}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDailyWakeUp(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily WakeUp time : ${_selectedDailyWakeTime != null ? formatTimeOfDay(_selectedDailyWakeTime!) : textdatas.dailyWakeUpTime}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDailBreakFast(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily breakfast time : ${_selectedDailyBreakfastTime != null ? formatTimeOfDay(_selectedDailyBreakfastTime!) : textdatas.dailyBreakfastTime}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDailLunch(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily Lunch time :${_selectedDailyLunchTime != null ? formatTimeOfDay(_selectedDailyLunchTime!) : textdatas.dailyLunchTime}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDinner(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily Dinner time : ${_selectedDailyDinnerTime != null ? formatTimeOfDay(_selectedDailyDinnerTime!) : textdatas.dailyDinnerTime}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForBed(context);
                },
                child: TimeSetter(
                    wokoutName:
                        'Set daily Bed time :${_selectedDailyBedTime != null ? formatTimeOfDay(_selectedDailyBedTime!) : textdatas.dailyBedTime}'),
              ),
              SizedBox(height: media.height * 0.05),
              RoundButton(
                title: 'Update',
                onPressed: () async {
                  await addDatas(
                      workout: WorkoutPlan(
                    name: nameController.text,
                    dailyWorkoutTime: formatTimeOfDay(
                        _selectedDailyWorkoutTime ?? dailyworkoutTime),
                    dailyWakeUpTime: formatTimeOfDay(
                        _selectedDailyWakeTime ?? dailyWakeUpTime),
                    dailyBreakfastTime: formatTimeOfDay(
                        _selectedDailyBreakfastTime ?? dailyBreakfastTime),
                    dailyLunchTime: formatTimeOfDay(
                        _selectedDailyLunchTime ?? dailyLunchTime),
                    dailyDinnerTime: formatTimeOfDay(
                        _selectedDailyDinnerTime ?? dailyDinnerTime),
                    dailyBedTime:
                        formatTimeOfDay(_selectedDailyBedTime ?? bedTime),
                    id: textdatas.id,
                  ));
                  await getDatas();
                  LocalNotifications.cancelNotification(2);
                  addToList();
                  LocalNotifications.scheduleNotification(
                      title: 'Daily Workout Reminder',
                      body:
                          'It\'s time for your daily workout! Stay active and healthy.',
                      payload: 'daily_workout_reminder',
                      scheduledTime:
                          _selectedDailyWorkoutTime ?? dailyworkoutTime,
                      daysOfWeek: selectedDays);
                  LocalNotifications.scheduleNotification(
                      title: 'Daily Wake-Up Reminder',
                      body:
                          'Rise and shine! It\'s time to start your day with energy and positivity. Seize the morning and embrace a new day filled with possibilities.',
                      payload: 'daily_wake_up_reminder',
                      scheduledTime: _selectedDailyWakeTime ?? dailyWakeUpTime,
                      daysOfWeek: selectedDays);
                  LocalNotifications.scheduleNotification(
                      title: 'Breakfast Time Reminder',
                      body:
                          'Good morning! It\'s time to fuel your day with a nutritious breakfast. Make it delicious and energizing!',
                      payload: 'breakfast_time_reminder',
                      scheduledTime:
                          _selectedDailyBreakfastTime ?? dailyBreakfastTime,
                      daysOfWeek: selectedDays);
                  LocalNotifications.scheduleNotification(
                      title: 'Lunch Reminder',
                      body:
                          'Hey there! It\'s lunchtime. Take a break and enjoy a nourishing meal to refuel your energy for the rest of the day.',
                      payload: 'lunch_time_reminder',
                      scheduledTime: _selectedDailyLunchTime ?? dailyLunchTime,
                      daysOfWeek: selectedDays);
                  LocalNotifications.scheduleNotification(
                      title: 'Dinner Reminder',
                      body:
                          'Good evening! It\'s dinner time. Treat yourself to a satisfying and nutritious dinner. Bon appétit!',
                      payload: 'dinner_time_reminder',
                      scheduledTime:
                          _selectedDailyDinnerTime ?? dailyDinnerTime,
                      daysOfWeek: selectedDays);
                  LocalNotifications.scheduleNotification(
                      title: 'Bedtime Reminder',
                      body:
                          'Good night! It\'s time to wind down and get ready for a restful sleep. Create a peaceful bedtime routine for a rejuvenating night\'s sleep.',
                      payload: 'bedtime_reminder',
                      scheduledTime: _selectedDailyBedTime ?? bedTime,
                      daysOfWeek: selectedDays);
// ignore: use_build_context_synchronously
                  Navigator.pop(context);

                  // ignore: use_build_context_synchronously
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx2) => const HomePage()),
                      (route) => false);
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

  String formatTimeOfDay(TimeOfDay? timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay!.hour, timeOfDay.minute);
    return '${dateTime.hour}:${dateTime.minute}';
  }

  TimeOfDay stringToTimeOfDay(String timeString) {
    List<String> components = timeString.split(':');
    int hour = int.parse(components[0]);
    int minute = int.parse(components[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }
}
