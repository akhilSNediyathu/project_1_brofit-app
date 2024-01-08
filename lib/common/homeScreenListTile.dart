import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class homeList extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;
  const homeList({super.key,required this.imageUrl,required this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 3,
      
      child:Container(
        height: media.height*0.08,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: Tcolo.tertiaryG),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: ListTile(
            onTap: onTap,
            leading: Image.asset(imageUrl,fit:BoxFit.fitWidth,),
            title: Text(title,style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Tcolo.white,
            ),),
          
          ),
        ),
      )
    );
  }
}