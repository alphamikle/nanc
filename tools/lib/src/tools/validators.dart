import 'package:flutter/cupertino.dart';

String? isRequiredValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Field is required!';
  }
  return null;
}

FormFieldValidator<String> groupOfValidators(List<FormFieldValidator<String>> validators) {
  return (String? value) {
    for (final FormFieldValidator<String> validator in validators) {
      final String? errorText = validator(value);
      if (errorText != null && errorText.trim() != '') {
        return errorText;
      }
    }
    return null;
  };
}
