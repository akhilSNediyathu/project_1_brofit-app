// ignore: file_names
import 'package:fitness_app/common/colo_extension.dart';
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
      
      child:SizedBox(
        height: media.height*0.08,
        
        child: Center(
          child: ListTile(
            
            leading: Image.asset(imageUrl,fit:BoxFit.fitWidth,),
            subtitle: Text(subtitle),
            trailing: IconButton(onPressed: onIconTap, icon: Image.asset(trailingimageUrl)),
           
            title: Text(title,style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Tcolo.black,
              
            ),),
          
          ),
        ),
      )
    );
  }
}