import 'package:eval_ex/expression.dart';
import 'package:tools/tools.dart';

import 'calculator.dart';

const List<String> defaultFunctions = [
  r'STREQ\(',
  r'FACT\(',
  r'NOT\(',
  r'IF\(',
  r'Random\(',
  r'SINR\(',
  r'COSR\(',
  r'TANR\(',
  r'COTR\(',
  r'SECR\(',
  r'CSCR\(',
  r'SIN\(',
  r'COS\(',
  r'TAN\(',
  r'COT\(',
  r'SEC\(',
  r'CSC\(',
  r'ASINR\(',
  r'ACOSR\(',
  r'ATANR\(',
  r'ACOTR\(',
  r'ATAN2R\(',
  r'ASIN\(',
  r'ACOS\(',
  r'ATAN\(',
  r'ACOT\(',
  r'ATAN2\(',
  r'RAD\(',
  r'DEG\(',
  r'MAX\(',
  r'MIN\(',
  r'MIN\(',
  r'ABS\(',
  r'LOG\(',
  r'LOG10\(',
  r'ROUND\(',
  r'FLOOR\(',
  r'CEILING\(',
  r'SQRT\(',
  r'[^\w]e[^\w]',
  r'[^\w]PI[^\w]',
  r'[^\w]NULL[^\w]',
  r'[^\w]TRUE[^\w]',
  r'[^\w]FALSE[^\w]',
  r'[^\w]true[^\w]',
  r'[^\w]false[^\w]',
];
final List<String> customFunctions = Calculator.registeredFunctions;

final RegExp mathOperators = RegExp(r'\d+ ?(\+|-|\*|\/|%|\^|(&&)|(\|\|)|>=|<=|!=|<>|>|<|==|=) ?\d+');
final RegExp functions = RegExp([...customFunctions, ...defaultFunctions].join('|'));

abstract final class Calculations {
  static String calculate(String expression) {
    if (_needToCalculate(expression)) {
      return _calculate(expression);
    }
    return expression;
  }

  static String _calculate(String expression) {
    try {
      final Stopwatch sw = Stopwatch()..start();
      final String result = Expression(expression).eval().toString();
      sw.stop();
      sw.reset();
      return result;
    } catch (error) {
      logError('Error on calculation expression "$expression":\n$error');
    }
    return expression;
  }

  static bool _needToCalculate(String expression) {
    if (expression.startsWith('http')) {
      return false;
    }

    return functions.hasMatch(expression) || mathOperators.hasMatch(expression);
  }
}
