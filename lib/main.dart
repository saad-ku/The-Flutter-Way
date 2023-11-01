import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignemnt 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tip Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _totalTip = 0.0;
  double _totalAmount = 0.0;
  double _currentSliderValue = 0;

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter the bill amount',
            ),
            TextFormField(
            controller: _textEditingController,
            onChanged: (value) {
              _calculateTip();
            },
          ),
           const Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0)
          ),
            const Text(
              'Select the Tip Percentage'
            ),
            Slider(
               value: _currentSliderValue,
               max: 30,
               divisions: 10,
               min: 0,
               label: '${_currentSliderValue.round()}%',
               onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
               _calculateTip();
        },
      ),
          Text(
              'Tip: PKR $_totalTip',
          ),
          Text(
                  'Total: PKR $_totalAmount',
          ),
          ],
        ),
      ),
    );
  }


  void _calculateTip() {
    setState(() {
      double billAmount = double.parse(_textEditingController.text);
      _totalTip = billAmount * (_currentSliderValue / 100);
      _totalAmount = _totalTip + billAmount;
    });
  }
}


