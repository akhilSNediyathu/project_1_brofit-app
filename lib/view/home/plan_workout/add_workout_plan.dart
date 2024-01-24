import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/time_setter.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/common_widget/round_textfield.dart';
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
                child: TimeSetter(wokoutName: 'Set daily Workout time : ${_selectedDailyWorkoutTime?.format(context) ?? '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForDailyWakeUp(context);
                },
                child: TimeSetter(wokoutName: 'Set daily WakeUp time : ${_selectedDailyWakeTime?.format(context) ?? '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                 _selectTimeForDailBreakFast(context);
                },
                child: TimeSetter(wokoutName: 'Set daily breakfast time : ${_selectedDailyBreakfastTime?.format(context) ?? '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                 _selectTimeForDailLunch(context);
                },
                child:  TimeSetter(wokoutName: 'Set daily Lunch time :${_selectedDailyLunchTime?.format(context) ?? '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                 _selectTimeForDinner(context);
                },
                child:  TimeSetter(wokoutName: 'Set daily Dinner time : ${_selectedDailyDinnerTime?.format(context) ?? '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () {
                  _selectTimeForBed(context);
                },
                child:  TimeSetter(wokoutName: 'Set daily Bed time :${_selectedDailyBedTime?.format(context) ?? '00:00 hrs'}'),
              ),
              SizedBox(height: media.height * 0.05),
              RoundButton(
                title: 'Save',
                onPressed: () {},
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
      initialTime: _selectedDailyWorkoutTime ?? TimeOfDay.now(),
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
        _selectedDailyDinnerTime= pickedTime;
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
}
