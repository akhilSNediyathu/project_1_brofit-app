import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class GradientFab extends StatelessWidget {
  final VoidCallback onPressed;

  GradientFab({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      height: 65.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: Tcolo.SecondaryG,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          Icons.restaurant,
          color: Color.fromARGB(255, 238, 234, 234),
        ),
        onPressed: onPressed,
      ),
    );
  }
}