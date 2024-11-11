import 'dart:core';

class Token {
  final String type;
  final String value;

  Token(this.type, this.value);

  @override
  String toString() => 'Token(type: $type, value: $value)';
}

class Scanner {
  static final List<Map<String, String>> patterns = [
    // 1. Keywords
    {
      'type': 'Keyword',
      'pattern':
          r'\b(auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|inline|int|long|register|restrict|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while)\b'
    },

    // 2. Identifiers
    {'type': 'Identifier', 'pattern': r'\b[a-zA-Z_]\w*\b'},

    // 3. Operators
    {'type': 'Operator', 'pattern': r'[+\-*/%=<>!&|^~]+|==|!=|<=|>='},

    // 4. Numeric constants (integers and floats with scientific notation)
    {'type': 'NumericConstant', 'pattern': r'\b\d+(\.\d+)?(e[+-]?\d+)?\b'},

    // 5. Character constants
    {'type': 'CharacterConstant', 'pattern': r"'.'"},

    // 6. String literals
    {'type': 'StringLiteral', 'pattern': r'"[^"]*"'},

    // 7. Special characters
    {'type': 'SpecialChar', 'pattern': r'[(){}[\],;.]'},

    // 8. Comments
    {'type': 'Comment', 'pattern': r'//.*|/\*[\s\S]*?\*/'},

    // 9. Whitespace
    {'type': 'Whitespace', 'pattern': r'[ \t]+'},

    // 10. Newline
    {'type': 'Newline', 'pattern': r'\n'},
  ];

  List<Token> scan(String input) {
    List<Token> tokens = [];
    String remaining = input;

    while (remaining.isNotEmpty) {
      bool matched = false;

      for (var pattern in patterns) {
        RegExp regExp = RegExp(pattern['pattern']!);
        var match = regExp.matchAsPrefix(remaining);

        if (match != null) {
          String value = match.group(0)!;
          
          if (pattern['type'] != 'Whitespace') {
            // تجاهل المسافات العادية
            tokens.add(Token(pattern['type']!, value));
          }
          remaining = remaining.substring(match.end);
          matched = true;
          break;
        }
      }

      if (!matched) {
        print("Unrecognized part: $remaining"); // عرض الجزء اللي مش متعرف عليه
        throw Exception("Error: Unrecognized token in input");
      }
    }

    return tokens;
  }
}

void main() {
  var scanner = Scanner();
  String code = 'if 1.2.3 < 6';

  var tokens = scanner.scan(code);
  tokens.forEach(print);
}
