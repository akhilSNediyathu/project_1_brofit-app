// ignore: file_names


import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/onBoardingPage.dart';
import 'package:fitness_app/view/login/signup_view.dart';
import 'package:flutter/material.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _onBoarding1State();
}

// ignore: camel_case_types
class _onBoarding1State extends State<OnBoarding1> {
  int selectPage = 0;
  PageController controller = PageController();
  @override
  void initState() {
   

    super.initState();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  List pageList = [
    {
      'title': 'HomefiT',
      'subtitle':
          'Your all-in-one home fitness solution. Elevate your workouts, anytime, anywhere.',
      'image': 'assets/img/onbo1.png'
    },
    {
      'title': 'Get Burn',
      'subtitle':
          "Let's keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      'image': 'assets/img/onbo 7.png'
    },
    {
      'title': 'BMI CALCULATOR',
      'subtitle':
          "Unlock your path to a healthier you with our cutting-edge BMI calculator function - effortlessly track and analyze your body mass index, setting you on the journey towards your fitness goals.",
      'image': 'assets/img/new2.png'
    },
    {
      'title': 'Eat Well',
      'subtitle':
          "Let's start a healthy lifestyle with us, its important to take healthy meal if you really want to complete this mission",
      'image': 'assets/img/new1.png'
    }
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageList.length,
              itemBuilder: (context, index) {
                var pObj = pageList[index] as Map? ?? {};
                return OnBoardingpage(pObj: pObj);
              }),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: Tcolo.Primarycolor1,
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            decoration: BoxDecoration(
                color: Tcolo.Primarycolor1,
                borderRadius: BorderRadius.circular(35)),
            child: IconButton(
              onPressed: () {
                if (selectPage < 3) {
                  selectPage = selectPage + 1;

                  controller.jumpToPage(selectPage);
                  setState(() {});
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>const SignUpView()));
                }
              },
              icon: Icon(
                Icons.navigate_next,
                color: Tcolo.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
