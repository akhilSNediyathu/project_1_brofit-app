import 'package:flutter/material.dart';
import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common_widget/tab_buttons.dart';
import 'package:brofit/view/home/plan_workout/plan_workout_welcome.dart';
import 'package:brofit/view/home/profile_view/profie_page.dart';
import 'package:brofit/view/main_tab_view.dart';
import 'package:brofit/view/bmicalculator/bmi_calc_view.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

int selectTab = 0;
 final PageController _pageController = PageController(initialPage: 0);
  

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    List<Widget> pages = [
      const MainTabView(),
      const PlanWorkoutWelcome(),
      const BmiWelcome(),
      const ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
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
      body: PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            selectTab = index;
          });
        },
      ),
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
                    _pageController.jumpToPage(0);
                  },
                  selectIcon: 'assets/img/home_tab_select.png',
                  icon: 'assets/img/home_tab.png',
                ),
                TAbButton(
                  isActive: selectTab == 1,
                  onTap: () {
                    _pageController.jumpToPage(1);
                  },
                  selectIcon: 'assets/img/workout planner1.png',
                  icon: 'assets/img/workout planner2.png',
                ),
                TAbButton(
                  isActive: selectTab == 2,
                  onTap: () {
                    _pageController.jumpToPage(2);
                  },
                  selectIcon: 'assets/img/calc 1 1.png',
                  icon: 'assets/img/calc.png',
                ),
                TAbButton(
                  isActive: selectTab == 3,
                  onTap: () {
                    _pageController.jumpToPage(3);
                  },
                  selectIcon: 'assets/img/profile_tab_select.png',
                  icon: 'assets/img/profile_tab.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
