import 'package:comidas_mundiales/category_meals_screen.dart';
import 'package:flutter/material.dart';
import 'categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comidas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoriesScreen(),
        '/category-meals': (context) => CategoryMealsScreen(),
      },
    );
  }
}
