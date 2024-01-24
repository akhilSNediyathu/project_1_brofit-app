import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common_widget/round_button_1.dart';
import 'package:brofit/view/on_boarding_screeens/onboarding_views.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: Container(
          padding:const EdgeInsets.symmetric(vertical: 15),
          width: media.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: Tcolo.primaryG,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Spacer(),
              Text(
                'BrofiT',
                style: TextStyle(
                    color: Tcolo.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'The Complete Fitness App',
                style: TextStyle(
                  color: Tcolo.gray,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: RoundButton(
                       
                        textColor: Tcolo.Primarycolor1,
                        buttonColor: Tcolo.white,
                        title: 'Get Started',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>const OnBoarding1()));
                        })),
              )
            ],
          )),
    );
  }
}
