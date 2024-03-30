abstract final class Calculator {
  static final Map<String, dynamic> _registeredFunctions = {};

  static List<String> get registeredFunctions => _registeredFunctions.keys.toList();

  static void registerFunction(String name) {
    //
  }
}
