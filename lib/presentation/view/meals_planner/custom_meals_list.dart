import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/database/hive/functions/add_custom_meals_fn.dart';

import 'package:brofit/database/hive/data_models/add_meals_data_model.dart';
import 'package:flutter/material.dart';

class CustomMealsList extends StatefulWidget {
  const CustomMealsList({Key? key}) : super(key: key);

  @override
  State<CustomMealsList> createState() => _CustomMealsListState();
}

class _CustomMealsListState extends State<CustomMealsList> {
  List<MealPlanner> finalmealslist = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    finalmealslist = await getmeals();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customized Menu'),
        centerTitle: true,
        backgroundColor: Tcolo.Primarycolor2,
      ),
      body: finalmealslist.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(finalmealslist[index].id),
                  onDismissed: (direction) async {
                    await deleteCustomMeals(meal: finalmealslist[index]);
                   
                    fetchData();
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(finalmealslist[index].mealList.keys.first), 
                    leading: const Icon(Icons.food_bank),
                  ),
                );
              },
              itemCount: finalmealslist.length,
            )
          : const Center(
              child: Text('No meals added'),
            ),
    );
  }
}
