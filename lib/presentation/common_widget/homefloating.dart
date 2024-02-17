import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GradientFab extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientFab({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: media.width * 0.13,
        height: media.width * 0.13,
        decoration: BoxDecoration(
          color: Tcolo.Lightgrey,
          gradient: LinearGradient(
            colors: Tcolo.tertiaryG,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: Lottie.asset(
          'assets/gif/heartrate.json', 
          width: media.width * 0.1,
          height: media.width * 0.11,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
