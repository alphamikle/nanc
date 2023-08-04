extension ExtendedNum on num {
  bool get isInt {
    if (this is int) {
      return true;
    }
    return truncateToDouble() == toDouble();
  }
}

extension ExtendedDouble on double {
  bool get isInt {
    if (this is int) {
      return true;
    }
    return truncateToDouble() == toDouble();
  }
}

enum NumberParsingErrorType {
  outOfLimit,
  invalidValue;

  bool get isOutOfLimit => this == NumberParsingErrorType.outOfLimit;
  bool get isInvalidValue => this == NumberParsingErrorType.invalidValue;
}

(int? number, NumberParsingErrorType? error, String? message) detailedIntFromString(String? value) {
  const Set<String> errors = {
    'Negative input exceeds the limit of integer',
    'Positive input exceeds the limit of integer',
  };

  if (value == null || value.trim() == '') {
    return (null, null, null);
  }
  try {
    final int number = int.parse(value);
    return (number, null, null);
  } catch (error) {
    if (error is FormatException && errors.contains(error.message)) {
      return (null, NumberParsingErrorType.outOfLimit, error.message);
    }
  }
  return (null, null, null);
}

(double? number, NumberParsingErrorType? error, String? message) detailedDoubleFromString(String? value) {
  if (value == null || value.trim() == '') {
    return (null, null, null);
  }
  try {
    final double number = double.parse(value);
    if (number.isInfinite) {
      return (null, NumberParsingErrorType.outOfLimit, null);
    }
    return (number, null, null);
  } catch (error) {
    if (error is FormatException) {
      return (null, NumberParsingErrorType.invalidValue, error.message);
    }
  }
  return (null, null, null);
}
