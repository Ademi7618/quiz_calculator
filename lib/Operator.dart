enum Operator {
  add,
  subtract,
  multiply,
  divide;

  @override
  String toString() {
    switch (this) {
      case Operator.add:
        return "+";
      case Operator.subtract:
        return "-";
      case Operator.multiply:
        return "×";
      case Operator.divide:
        return "÷";
    }
  }
}