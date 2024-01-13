
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common/homeScreenListTile.dart';

import 'package:fitness_app/common_widget/homefloating.dart';

import 'package:fitness_app/view/meals_planner/welcome_screen.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  @override
  Widget build(BuildContext context) {;
    
    var media = MediaQuery.of(context).size;
    
    return Scaffold(
      
      // appBar: AppBar(
      //     automaticallyImplyLeading: false,
      //   backgroundColor: Tcolo.Primarycolor1,
      //   title: Center
      //   (child: Text
      //   ('Start Your Workout',style: TextStyle(
      //     fontSize: 18,
      //     fontWeight: FontWeight.w700,
      //     color: Tcolo.white
      //   ),)
      //   ),
      // ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
       decoration: BoxDecoration(
        color: Tcolo.black,
        image: const DecorationImage
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
        Navigator.push(context, MaterialPageRoute(builder:(ctx)=>const mealsPlannerWelcome()));

      }),
     
  

    );
  }
}