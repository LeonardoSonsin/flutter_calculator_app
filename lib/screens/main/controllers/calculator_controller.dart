class CalculatorController {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textDisplay = '0';
  String res = '0';
  String operation = '';

  void clearAll() {
    textDisplay = '0';
    firstNum = 0;
    secondNum = 0;
    res = '0';
    history = '';
  }

  void safeClear() {
    textDisplay = '0';
    firstNum = 0;
    secondNum = 0;
    res = '0';
  }

  void changeSign() {
    if (textDisplay[0] != '-') {
      res = '-$textDisplay';
    } else {
      res = textDisplay.substring(1);
    }
  }

  void saveFirstNum(String buttonValue) {
    firstNum = int.parse(textDisplay);
    res = '';
    operation = buttonValue;
    history = firstNum.toString() + operation.toString();
  }

  void removeLast() {
    if (textDisplay.length == 1) {
      res = '0';
    } else {
      res = textDisplay.substring(0, textDisplay.length - 1);
    }
  }

  void saveSecondNum() {
    secondNum = int.parse(textDisplay);
  }

  void calculateSum() {
    res = (firstNum + secondNum).toString();
    history = firstNum.toString() + operation.toString() + secondNum.toString();
  }

  void calculateSub() {
    res = (firstNum - secondNum).toString();
    history = firstNum.toString() + operation.toString() + secondNum.toString();
  }
}
