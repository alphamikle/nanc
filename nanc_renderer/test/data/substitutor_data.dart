const String firstCase = '''
Hello, {{ page.user.name }}!
Today, we can offer to you {{ 3 + 5 }} discounts.
What will you choose? {{ true }}? Or {{ false }}?
''';

const String firstResult = '''
Hello, Mike!
Today, we can offer to you 8 discounts.
What will you choose? true? Or false?
''';
