extension Helpers on String {
  bool phoneNumberValidator() {
    const String pattern = r'^(?:[0]9)?[0-9]{10}$';
    final RegExp regex = RegExp(pattern);

    return regex.hasMatch(this);
  }

  bool emailValidator() {
    const String pattern = r'^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}';
    final RegExp regex = RegExp(pattern);

    return regex.hasMatch(this);
  }

  int numbersLineText() {
    final int numLines = '\n'.allMatches(this).length + 1;

    return numLines;
  }

  String capitalize() {
    if (isEmpty) {
      return this;
    }

    return this[0].toUpperCase() + substring(1);
  }

  bool isURL() {
    return startsWith('https') || startsWith('http');
  }
}
