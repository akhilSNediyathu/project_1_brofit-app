import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/round_Button.dart';
import 'package:fitness_app/view/login/complete_profile.dart';
import 'package:fitness_app/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class WhoNeedsMe extends StatefulWidget {
  const WhoNeedsMe({super.key});

  @override
  State<WhoNeedsMe> createState() => _WhoNeedsMeState();
}

class _WhoNeedsMeState extends State<WhoNeedsMe> {
  CarouselController buttonCarouselController = CarouselController();
  List
   goalArr=
   [{'image':"assets/img/carrousel1.png",'title':"Improve Shape",'subtitle':"I have a low amount of body fat \nand need / want to build more\n muscle"},
   {'image':"assets/img/carrousel2.png",'title':"Lean & Tone",'subtitle':"I'm “skinny fat”. look thin but have\n no shape. I want to add learn \nmuscle in the right way"},
   {'image':"assets/img/carrousel 3.png",'title':"Lose a Fat",'subtitle':"I have over 20 lbs to lose. I want to\n drop all this fat and gain muscle\n mass"},
    
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
              items: goalArr
                
                  .map((gObj) => Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: Tcolo.primaryG,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              

                              ),
                              borderRadius: BorderRadius.circular(25)
                              ),
                              padding: EdgeInsets.symmetric(vertical: media.width*0.1,horizontal: 25),
                              alignment: Alignment.center,
                              child: FittedBox(
                                child: Column(
                                  children: [
                                    Image.asset(gObj['image'].toString(),width: media.width*0.8,fit: BoxFit.fitWidth,),
                                    SizedBox(height: media.width*0.1,),
                                    Text(
                                                 gObj['title'].toString(),
                                                  style: TextStyle(
                                                      color: Tcolo.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                 Container(
                                                  width: media.width*0.1,
                                                  height: 1,
                                                  color: Tcolo.white,
                                                 ),
                                                 SizedBox(
                                                  height: media.width*0.02,
                                                 ),
                                                Text(
                                                  gObj['subtitle'].toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(color: Tcolo.white, fontSize: 13),
                                                ),
                                  ],
                                ),
                              ),
                      ))
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.75,
                aspectRatio: 0.8,
                initialPage: 0,
                
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: media.width,
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Who  needs me?",
                  style: TextStyle(
                      color: Tcolo.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Discover a stronger you - your journey starts here. Let's crush it together",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Tcolo.gray, fontSize: 13),
                ),
                Spacer(),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundButton(
                  textColor: Tcolo.white,
                  title: 'Next >',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomeView()));
                  },
                  buttonColor: Tcolo.Primarycolor1,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
