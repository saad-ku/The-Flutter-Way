import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => TipCalculatorState();
}

class TipCalculatorState extends State<TipCalculator> {

  double _totalTip = 0.0;
  double _totalAmount = 0.0;
  double _currentSliderValue = 0;

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tip Calculator"),
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter the bill amounts',
            ),
            TextFormField(
            controller: _textEditingController,
            onChanged: (value) {
              _calculateTip();
            },
          ),
           const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0)
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


