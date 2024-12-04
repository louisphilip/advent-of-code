import 'dart:io';

Future<void> main() async {
  // Path to the file containing the corrupted memory
  var filePath =
      'inputs/day3/corruptedMemory.txt'; // Change this to your file path

  try {
    // Read the file content as a string
    String corruptedMemory = await File(filePath).readAsString();

    // Use a regular expression to find valid mul(X,Y) patterns
    RegExp regExp = RegExp(
        r'mul\((\d+),(\d+)\)'); // Match mul(X,Y) where X and Y are numbers

    // Find all matches in the corrupted memory
    Iterable<RegExpMatch> matches = regExp.allMatches(corruptedMemory);

    int totalSum = 0;

    // Iterate over all matches and calculate the sum
    for (var match in matches) {
      int x = int.parse(match.group(1)!); // Get the first number (X)
      int y = int.parse(match.group(2)!); // Get the second number (Y)
      totalSum += x * y; // Multiply and add to total sum
    }

    // Output the total sum
    print('Total sum of valid multiplications: $totalSum');
  } catch (e) {
    print('Error reading file: $e');
  }
}
