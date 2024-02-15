import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common/common_text_styles.dart';
import 'package:brofit/presentation/common_widget/small_round_button.dart';
import 'package:brofit/presentation/view/home/plan_workout/add_workout_plan.dart';
import 'package:brofit/database/hive/functions/data_base_functions.dart';
import 'package:brofit/database/hive/data_models/data_model.dart';
import 'package:brofit/presentation/view/home/plan_workout/plan_details.dart';
import 'package:flutter/material.dart';


class PlanWorkoutWelcome extends StatefulWidget {
  const PlanWorkoutWelcome({super.key});

  @override
  State<PlanWorkoutWelcome> createState() => _PlanWorkoutWelcomeState();
}

class _PlanWorkoutWelcomeState extends State<PlanWorkoutWelcome> {
  WorkoutPlan? details;
  @override
  void initState() {
    if (finaldatas.isNotEmpty) {
      details = finaldatas[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Tcolo.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Workout Schedule',
                    style: AppTextStyles.subtitleTextStyle(context),
                  ),
                  SizedBox(height: media.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/planworkoutwelcome.png',
                        height: media.height * 0.2,
                      ),
                    ],
                  ),
                  Center(
                      child: Text(
                    'Plan your workout session and conquer your fitness goals with personalized routines tailored just for you',
                    style: AppTextStyles.loginEnding,
                    textAlign: TextAlign.center,
                  )),
                  SizedBox(height: media.height * 0.09),
                  SizedBox(
                    height: media.height * 0.25,
                    width: media.width * 0.8,
                    child: Card(
                      elevation: 3,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(child: Image.asset('assets/img/plan.png')),
                              SizedBox(
                                height: media.height * 0.02,
                              ),
                              finaldatas.isEmpty
                                  ? Text('Set Your Workout plan now',
                                      style: AppTextStyles.subtitleTextStyle(
                                          context))
                                  : Text(details!.name,
                                      style: AppTextStyles.subtitleTextStyle(
                                          context)),
                              // ,
                              SizedBox(
                                height: media.height * 0.02,
                              ),
                              finaldatas.isEmpty
                                  ? SmallRoundbutton(
                                      title: 'Add',
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const AddWorkoutPlan()));
                                      },
                                      buttonColor: Tcolo.Primarycolor1,
                                      textColor: Tcolo.white)
                                  :
                                  //
                                  SmallRoundbutton(
                                      title: 'viewdetails',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PlanDetailsPage(
                                                details: details!),
                                          ),
                                        );
                                      },
                                      buttonColor: Tcolo.Primarycolor1,
                                      textColor: Tcolo.white)
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
