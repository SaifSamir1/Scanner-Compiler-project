C Language Scanner
This project is a scanner for C language code, built as part of a compiler design study. The scanner, often called a lexical analyzer, reads through C source code and identifies tokens, which are the building blocks of the language's syntax. This scanner project is focused on recognizing different token types such as keywords, identifiers, operators, and symbols, providing an essential step in compiling C code.

Features
Token Identification: Parses C source code and identifies tokens, including keywords (int, if, return, etc.), identifiers (variable names, function names), operators (+, -, =, etc.), and punctuation symbols (;, {, }).
Error Reporting: Detects and flags errors in token recognition, such as illegal characters or malformed tokens.
Stream Processing: Processes the input code as a stream, efficiently scanning line by line.
How It Works
Input: Takes a C source code file as input.
Lexical Analysis: The scanner reads each character, groups them into valid tokens based on predefined patterns, and categorizes them accordingly.
Output: Produces a list of tokens, each labeled with its type, and reports any lexical errors found in the code.
Getting Started
Prerequisites: Ensure you have the necessary environment to run the scanner, such as a compatible C compiler (if you're implementing in C) or a Dart environment (if using Dart).
Usage: Run the scanner with a C source file to get a list of recognized tokens and any error messages related to lexical issues.
Example Output
For a sample C code:

c
Copy code
int main() {
    int x = 5;
    if (x > 3) {
        return x;
    }
}
The scanner output might look like:

makefile
Copy code
Keyword: int
Identifier: main
Symbol: (
Symbol: )
Symbol: {
Keyword: int
Identifier: x
Operator: =
Number: 5
Symbol: ;
...
Future Work
In the future, this scanner could be extended to handle more complex features, such as:

Additional Token Types: Recognize more complex tokens, such as floating-point numbers and string literals.
Integration with Parser: Pass tokenized output directly to a parser for further syntactic analysis.
