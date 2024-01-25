
import 'package:brofit/common/colo_extension.dart';
import 'package:flutter/material.dart';

class TAbButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final VoidCallback onTap;
  final bool isActive;
  const TAbButton({super.key,required this.isActive,required this.onTap,required this.selectIcon,required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap:onTap
            
            ,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(isActive ? selectIcon: icon,width: 25,height: 25,fit: BoxFit.fitWidth,),
                      SizedBox(
                        height: isActive?8:2,
                      ),
                      if(isActive)
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: Tcolo.SecondaryG)
                        ),
                        height: 4,
                        width: 4,

                      )
                    ],
                  ),
                );
  }
}