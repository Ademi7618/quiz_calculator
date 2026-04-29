
import 'package:flutter/material.dart';
import 'package:quiz_calculator/Operand.dart';
import 'package:quiz_calculator/Operator.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0";

  Operand firstOperand = Operand();
  Operand? secondOperand;
  late Operand currentOperand = firstOperand;
  Operator? operator;

  // 🔹 История операций
  List<String> history = [];

  void update() {
    setState(() {
      _output = currentOperand.toString();
    });
  }

  void clear() {
    firstOperand = Operand();
    secondOperand = null;
    currentOperand = firstOperand;
    operator = null;

    history.clear(); // очищаем историю

    update();
  }

  void equal() {
    if (operator == null || secondOperand == null) return;

    String expression =
        "${firstOperand.toString()} ${operator.toString()} ${secondOperand.toString()}";

    firstOperand.operation(operator!, secondOperand!);

    // 🔹 добавляем в историю
    history.add("$expression = ${firstOperand.toString()}");

    secondOperand = null;
    operator = null;
    currentOperand = firstOperand;

    update();
  }

  void onDigitClick(int digit) {
    currentOperand.addDigit(digit);
    update();
  }

  void onOperatorClick(Operator operator) {
    if (this.operator != null) {
      equal();
    }
    this.operator = operator;
    secondOperand = Operand();
    currentOperand = secondOperand!;
  }

  @override
  Widget build(BuildContext context) {
    if (history.length > 3) history = history.sublist(history.length - 3);
    return Scaffold(
      backgroundColor: Color(0xFF222630),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),

            SizedBox(
              height: 120,
              child: ListView(
                reverse: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: history.reversed.map((item) {
                  return Text(
                    item,
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.grey, fontSize: 28),
                  );
                }).toList(),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.bottomRight,
                child: Text(
                  ( history.isEmpty ? '' : '= ' ) + _output,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Button(
                        text: "C",
                        onPressed: clear,
                        color: Color(0xFF626B7C),
                        secondColor: Color(0xFF465262),
                      ),
                      Button(
                        text: "+/-",
                        onPressed: () {
                          currentOperand.changeSign();
                          update();
                        },
                        color: Color(0xFF626B7C),
                        secondColor: Color(0xFF465262),
                      ),
                      Button(
                        text: "%",
                        onPressed: () {},
                        color: Color(0xFF626B7C),
                        secondColor: Color(0xFF465262),
                      ),
                      Button(
                        text: "÷",
                        onPressed: () {
                          onOperatorClick(Operator.divide);
                        },
                        color: Color(0xFFE28D21),
                        secondColor: Color(0xFFDD732F),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Button(
                        text: "7",
                        onPressed: () {
                          onDigitClick(7);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "8",
                        onPressed: () {
                          onDigitClick(8);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "9",
                        onPressed: () {
                          onDigitClick(9);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "×",
                        onPressed: () {
                          onOperatorClick(Operator.multiply);
                        },
                        color: Color(0xFFE28D21),
                        secondColor: Color(0xFFDD732F),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        text: "4",
                        onPressed: () {
                          onDigitClick(4);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "5",
                        onPressed: () {
                          onDigitClick(5);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "6",
                        onPressed: () {
                          onDigitClick(6);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "-",
                        onPressed: () {
                          onOperatorClick(Operator.subtract);
                        },
                        color: Color(0xFFE28D21),
                        secondColor: Color(0xFFDD732F),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        text: "1",
                        onPressed: () {
                          onDigitClick(1);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "2",
                        onPressed: () {
                          onDigitClick(2);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "3",
                        onPressed: () {
                          onDigitClick(3);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "+",
                        onPressed: () {
                          onOperatorClick(Operator.add);
                        },
                        color: Color(0xFFE28D21),
                        secondColor: Color(0xFFDD732F),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        text: "0",
                        onPressed: () {
                          onDigitClick(0);
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                        flex: 2,
                      ),
                      Button(
                        text: ".",
                        onPressed: () {
                          currentOperand.addComma();
                          update();
                        },
                        color: Color(0xFF393E51),
                        secondColor: Color(0xFF2A303E),
                      ),
                      Button(
                        text: "=",
                        onPressed: () {
                          equal();
                        },
                        color: Color(0xFFE28D21),
                        secondColor: Color(0xFFDD732F),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color secondColor;
  final double fontSize;
  final int flex;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.secondColor,
    this.fontSize = 24,
    this.flex = 1,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(5.13),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [secondColor, color],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: fontSize),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
