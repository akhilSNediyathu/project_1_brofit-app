import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/homeScreenListTile.dart';
import 'package:fitness_app/common_widget/Tab_Buttons.dart';
import 'package:fitness_app/common_widget/homefloating.dart';
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
    var media = MediaQuery.of(context).size;
    
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
          fontWeight: FontWeight.w700,
          color: Tcolo.white
        ),)
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
       decoration: BoxDecoration(
        color: Tcolo.black,
        image: DecorationImage
        (image: AssetImage('assets/img/homebg.jpeg'),
        fit: BoxFit.cover,opacity: 0.5)
       ),
       child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          homeList
          (imageUrl: 'assets/img/listTile1.png', onTap: (){
       
          }, 
          title: 'Total Arm Toning'),
          SizedBox(height: media.width*0.04,),
          homeList
          (imageUrl: 'assets/img/listTile2.png', onTap: (){
       
          }, 
          title: 'Chisel Your Chest'),
          SizedBox(height: media.width*0.04,),
          homeList
          (imageUrl: 'assets/img/listTile3.png', onTap: (){
       
          }, 
          title: 'Six-Pack Sprint'),
          SizedBox(height: media.width*0.04,),
          homeList
          (imageUrl: 'assets/img/listTile4.png', onTap: (){
       
          }, 
          title: 'Legendary Leg Lifts'),

        ],
       ),
      ),
      floatingActionButton: GradientFab(onPressed: (){

      }),
     
  

    );
  }
}