import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final bool isOperator;
  final Function callback;

  const CalculatorButton(
      {Key? key,
      required this.text,
      required this.isOperator,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => callback(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: isOperator ? Colors.orange[800] : Colors.grey[800],
        fixedSize: Size(MediaQuery.of(context).size.width / 4 - 5,
            MediaQuery.of(context).size.height / 7 - 30),
        textStyle: const TextStyle(
            fontWeight: FontWeight.normal, fontSize: 24, color: Colors.white),
      ),
      child: Text(text),
    );
  }
}
