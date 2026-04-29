
import 'package:quiz_calculator/Operator.dart';

class Operand {
  bool _isNegative = false;
  int _integer = 0;
  bool _haveComma = false;
  int _zeroAfterComma = 0;
  int _decimal = 0;

  void addComma() {
    _haveComma = true;
  }

  void changeSign() {
    _isNegative = !_isNegative;
  }

  void addDigit(int digit) {
    if (_haveComma) {
      if (digit == 0 && _decimal == 0) {
        _zeroAfterComma ++;
      } else {
        _decimal = (_decimal * 10) + digit;
      }
    } else {
      _integer = (_integer * 10) + digit;
    }
  }

  void operation(Operator operator, Operand operand) {
    double firstOperand = double.parse(toString());
    double secondOperand = double.parse(operand.toString());
    double result;
    switch (operator) {
      case Operator.add:
        result = firstOperand + secondOperand;
        break;
      case Operator.divide:
        result = firstOperand / secondOperand;
        break;
      case Operator.multiply:
        result = firstOperand * secondOperand;
      default:
        result = firstOperand - secondOperand;
    }
    _set(result);

  }

  @override
  String toString() {
    String result = (_isNegative ? "-" : "") + _integer.toString();
    /*
    if (_haveComma && _decimal != 0) {
      result += ".${"0" * _zeroAfterComma}$_decimal";
    }
     */
    if (_haveComma) {
      result += ".${"0" * _zeroAfterComma}${_decimal != 0 ? _decimal : ""}";
    }
    return result;
  }
  
  void _set(double number) {
    if (number % 1 != 0) {
      String numStr = number.toString();
      if (numStr.startsWith("-")) {
        _isNegative = true;
        numStr = numStr.substring(1);
      } else {
        _isNegative = false;
      }
      _integer = int.parse(numStr.substring(0, numStr.indexOf(".")));
      _haveComma = true;
      String decimal =  numStr.substring(numStr.indexOf(".") + 1);
      _decimal = int.parse(decimal);
      _zeroAfterComma = 0;
      for (int i = 0; i < decimal.length; i++) {
        if (decimal[i] == '0') {
          _zeroAfterComma++;
        } else {
          break;
        }
      }
    } else {
      _integer = number.toInt();
      _haveComma = false;
      _zeroAfterComma = 0;
      _decimal = 0;
    }
  }

}

