import 'package:brofit/common/colo_extension.dart';
import 'package:flutter/material.dart';

class PlanMeals extends StatefulWidget {
  const PlanMeals({super.key});

  @override
  State<PlanMeals> createState() => _PlanMealsState();
}

class _PlanMealsState extends State<PlanMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        title: const Text('Plan Your Meals'),
        centerTitle: true,
      ),
    );
  }
}