import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common_widget/tab_buttons.dart';
import 'package:brofit/view/home/plan_workout/plan_workout_welcome.dart';
import 'package:brofit/view/home/profile_view/profie_page.dart';
import 'package:brofit/view/main_tab_view.dart';
import 'package:flutter/material.dart';

import '../bmicalculator/bmi_calc_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectTab = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    List pages = [
      const MainTabView(),
      const PlanWorkoutWelcome(),
      const BmiWelcome(),
    const  ProfilePage()
    ];
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){
        //   Navigator.pop(context);

        // }, icon: Image.asset('assets/img/Back-Navs.png'),color: Tcolo.Primarycolor1,),
        automaticallyImplyLeading: false,
        backgroundColor: Tcolo.Primarycolor1,
        title: Image.asset(
          'assets/img/appbartext (1).png',
          width: media.width * 0.5,
          height: media.height * 0.02,
        ),
        centerTitle: true,
        elevation: 3,
      ),
      backgroundColor: Tcolo.white,
      body: pages[selectTab],
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TAbButton(
                    isActive: selectTab == 0,
                    onTap: () {
                      selectTab = 0;
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    selectIcon: 'assets/img/home_tab_select.png',
                    icon: 'assets/img/home_tab.png'),
                TAbButton(
                    isActive: selectTab == 1,
                    onTap: () {
                      selectTab = 1;
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    selectIcon: 'assets/img/workout planner1.png',
                    icon: 'assets/img/workout planner2.png'),

                TAbButton(
                    isActive: selectTab == 2,
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>bmi_welcome()));
                      selectTab = 2;
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    selectIcon: 'assets/img/calc 1 1.png',
                    icon: 'assets/img/calc.png'),

                //   TAbButton(isActive: selectTab==3, onTap: (){

                //   selectTab=3;
                //     if(mounted){
                //       setState(() {

                //       });

                //     }

                // }, icon: 'assets/img/mealsplanner.png',
                //  selectIcon: 'assets/img/mealsplanner2.png'),

                TAbButton(
                    isActive: selectTab == 3,
                    onTap: () {
                      // FirebaseAuth.instance.signOut();
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>LoginView()));
                      selectTab = 3;
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    selectIcon: 'assets/img/profile_tab_select.png',
                    icon: 'assets/img/profile_tab.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
