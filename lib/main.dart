import 'package:flutter/material.dart';
import 'package:flutter_assg_1/grocery_list.dart';
import 'package:flutter_assg_1/tip_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction to Flutter & Dart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const GroceryWidget(),
      // home: const TipCalculator(),
    );
  }
}

