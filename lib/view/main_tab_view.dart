import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/Tab_Buttons.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}
int selectTab=0;
class _MainTabViewState extends State<MainTabView> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Tcolo.white,
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Container(
            height: kToolbarHeight,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  TAbButton(isActive: selectTab==0, onTap: (){
                  selectTab=0;
                    if(mounted){
                      setState(() {
                        
                      });

                    }
                  
                 }, selectIcon: 'assets/img/home_tab_select.png',
                  icon: 'assets/img/home_tab.png'),
                TAbButton(isActive: selectTab==1, onTap: (){
                  selectTab=1;
                    if(mounted){
                      setState(() {
                        
                      });

                    }
                  
                }, selectIcon: 'assets/img/activity_tab_select.png',
                 icon: 'assets/img/activity_tab.png'),

                TAbButton(isActive: selectTab==2, onTap: (){
                  selectTab=2;
                    if(mounted){
                      setState(() {
                        
                      });

                    }
                  
                }, selectIcon: 'assets/img/calc 1 1.png',
                 icon: 'assets/img/calc.png'),
                
              

                  TAbButton(isActive: selectTab==3, onTap: (){
                  selectTab=3;
                    if(mounted){
                      setState(() {
                        
                      });

                    }
                  
                }, selectIcon: 'assets/img/profile_tab_select.png',
                 icon: 'assets/img/profile_tab.png'),

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Tcolo.Primarycolor1,
        title: Center
        (child: Text
        ('Start Your Workout',style: TextStyle(
          fontSize: 18,
          color: Tcolo.white
        ),)
        ),
      ),
      body: Container(
       decoration: BoxDecoration(
        color: Tcolo.black,
        image: DecorationImage
        (image: AssetImage('assets/img/homebg.jpeg'),
        fit: BoxFit.cover,opacity: 0.5)
       ),
      ),
     
  

    );
  }
}