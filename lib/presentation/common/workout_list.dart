// ignore: file_names

import 'package:brofit/presentation/common/common_text_styles.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class WorkoutList extends StatelessWidget {
  final String title;
  final String imageUrl;
 
  final VoidCallback? onIconTap;
   final String subtitle;
   final String trailingimageUrl;
  const WorkoutList({super.key,required this.imageUrl,required this.onIconTap,required this.title ,required this.subtitle,required this.trailingimageUrl});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 3,
      
      child:Center(
        child: SizedBox(
          
          height: media.height*0.089,
      
          child: Center(
            
            child: ListTile(
              
              
              leading: SizedBox(
                height: media.height*0.06,
                child: Image.asset(imageUrl,fit:BoxFit.contain,),),
              subtitle: Text(subtitle,style:AppTextStyles.workoutListSub(context)),
              trailing: IconButton(onPressed: onIconTap, icon: Image.asset(trailingimageUrl)),
             
              title: Text(title,style: AppTextStyles.subtitleTextStyle(context),
              ),
            
            ),
          ),
        ),
      )
    );

    
  }
}