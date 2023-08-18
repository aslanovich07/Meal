import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals,});
  final String? title;
  final List<Meal> meals;
    

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealDetaiScreen(meal: meal,),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return Text(meals[index].title);
      },
    );
    if (meals.isEmpty) {
      content = const Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Oh there is no data '),
          SizedBox(
            height: 16,
          ),
          Text('Please try again')
        ]),
      );
    }
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: meals[index],
            onSelect: (meal) => selectMeal(context, meal),
          );
        },
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
