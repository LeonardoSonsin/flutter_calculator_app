import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/screens/main/controllers/calculator_controller.dart';

import 'calculator_button.dart';

class CalculatorLayout extends StatefulWidget {
  const CalculatorLayout({Key? key}) : super(key: key);

  @override
  State<CalculatorLayout> createState() => _CalculatorLayoutState();
}

class _CalculatorLayoutState extends State<CalculatorLayout> {
  CalculatorController _controller = CalculatorController();

  void onPressed(String buttonValue) {
    print(buttonValue);

    if (buttonValue == 'C')
    {
      _controller.safeClear();
    }

    else if (buttonValue == 'AC')
    {
      _controller.clearAll();
    }

    else if (buttonValue == '+/-')
    {
      _controller.changeSign();
    }

    else if (buttonValue == '+' || buttonValue == '-' || buttonValue == 'X' || buttonValue == '/')
    {
      _controller.saveFirstNum(buttonValue);
    }

    else if (buttonValue == '<')
    {
      _controller.removeLast();
    }

    else if (buttonValue == '=')
    {
      _controller.saveSecondNum();

      if (_controller.operation == '+')
      {
        _controller.calculateSum();
      }

      if (_controller.operation == '-') {
        _controller.calculateSub();
      }
      if (_controller.operation == 'X') {
        _controller.res =
            (_controller.firstNum * _controller.secondNum).toString();
        _controller.history = _controller.firstNum.toString() +
            _controller.operation.toString() +
            _controller.secondNum.toString();
      }
      if (_controller.operation == '/') {
        _controller.res =
            (_controller.firstNum ~/ _controller.secondNum).toString();
        _controller.history = _controller.firstNum.toString() +
            _controller.operation.toString() +
            _controller.secondNum.toString();
      }
    } else {
      _controller.res = int.parse(_controller.textDisplay + buttonValue).toString();
    }

    setState(() {
      _controller.textDisplay = _controller.res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 110, right: 15, bottom: 10),
            child: Text(
              _controller.history.length < 15 ? _controller.history : 'Erro',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white24),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, bottom: 15),
            child: Text(
              _controller.textDisplay.length < 15
                  ? _controller.textDisplay
                  : 'Erro',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 54,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalculatorButton(
                  text: 'AC',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: 'C',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '<',
                  isOperator: true,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '/',
                  isOperator: true,
                  callback: onPressed,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalculatorButton(
                  text: '7',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '8',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '9',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: 'X',
                  isOperator: true,
                  callback: onPressed,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalculatorButton(
                  text: '4',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '5',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '6',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '-',
                  isOperator: true,
                  callback: onPressed,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalculatorButton(
                  text: '1',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '2',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '3',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '+',
                  isOperator: true,
                  callback: onPressed,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalculatorButton(
                  text: '+/-',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '0',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: ',',
                  isOperator: false,
                  callback: onPressed,
                ),
                CalculatorButton(
                  text: '=',
                  isOperator: true,
                  callback: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
