import 'package:config/config.dart';
import 'package:decimal/decimal.dart';
import 'package:eval_ex/built_ins.dart';
import 'package:eval_ex/expression.dart';
import 'package:flutter/foundation.dart';
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

final RegExp mathOperators = RegExp(r'\d+ ?(\+|-|\*|\/|%|\^|>=|<=|!=|<>|>|<|==|=) ?\d+');
final RegExp logicOperators = RegExp(r'\w+ ?((&&)|(\|\|)|>=|<=|<>|==|=) ?\w+');
final RegExp functions = RegExp([...customFunctions, ...defaultFunctions].join('|'));
// 2023-02-03T17:46:57.175029
final RegExp dateTimeRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.?\d{0,6}$');

abstract final class Calculations {
  static String calculate(String expression) {
    if (_needToCalculate(expression)) {
      return _calculate(expression);
    }
    return expression;
  }

  static String _calculate(String expression) {
    try {
      // final Stopwatch sw = Stopwatch()..start();
      final String result = _createExpression(expression).eval().toString();
      // sw.stop();
      // sw.reset();
      return result;
    } catch (error) {
      if (kDebugMode && Env.showCalculationErrors) {
        logError('Error on calculation expression "$expression":\n$error');
      }
    }
    return expression;
  }

  static bool _needToCalculate(String expression) {
    if (expression.startsWith('http')) {
      return false;
    }
    if (expression.startsWith('[')) {
      return false;
    }
    if (dateTimeRegExp.hasMatch(expression)) {
      return false;
    }
    return logicOperators.hasMatch(expression) || functions.hasMatch(expression) || mathOperators.hasMatch(expression);
  }

  static Expression _createExpression(String expression) {
    final Expression result = Expression(expression);
    result.addOperator(
      OperatorImpl(
        'and',
        Expression.operatorPrecedenceAnd,
        false,
        booleanOperator: true,
        fEval: (v1, v2) {
          final bool b1 = v1.compareTo(Decimal.zero) != 0;

          if (!b1) {
            return Decimal.zero;
          }

          final bool b2 = v2.compareTo(Decimal.zero) != 0;

          return b2 ? Decimal.one : Decimal.zero;
        },
      ),
    );
    result.addOperator(
      OperatorImpl(
        'or',
        Expression.operatorPrecedenceOr,
        false,
        booleanOperator: true,
        fEval: (v1, v2) {
          final bool b1 = v1.compareTo(Decimal.zero) != 0;

          if (b1) {
            return Decimal.one;
          }

          final bool b2 = v2.compareTo(Decimal.zero) != 0;

          return b2 ? Decimal.one : Decimal.zero;
        },
      ),
    );
    return result;
  }
}
