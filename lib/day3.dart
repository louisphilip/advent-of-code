// Part2 Day3

import 'dart:io';

Future<void> main() async {
  // Path to the file containing the corrupted memory
  var filePath =
      'inputs/day3/corruptedMemory.txt'; // Change this to your file path

  try {
    // Read the file content as a string
    String corruptedMemory = await File(filePath).readAsString();

    // Regular expressions for mul, do, and don't instructions
    RegExp mulRegExp = RegExp(r'mul\((\d+),(\d+)\)');
    RegExp doRegExp = RegExp(r'do\(\)');
    RegExp dontRegExp = RegExp(r"don't\(\)");

    // Tracking whether mul instructions are enabled or not
    bool mulEnabled = true;
    int totalSum = 0;

    // Process each match in the corrupted memory
    int currentIndex = 0;
    while (currentIndex < corruptedMemory.length) {
      // Check for mul(X,Y) instructions
      var mulMatch = mulRegExp.matchAsPrefix(corruptedMemory, currentIndex);
      if (mulMatch != null) {
        // If mul is enabled, process it
        if (mulEnabled) {
          int x = int.parse(mulMatch.group(1)!);
          int y = int.parse(mulMatch.group(2)!);
          totalSum += x * y;
        }
        // Move the index to the end of the current mul instruction
        currentIndex = mulMatch.end;
      }

      // Check for do() instruction
      var doMatch = doRegExp.matchAsPrefix(corruptedMemory, currentIndex);
      if (doMatch != null) {
        mulEnabled = true; // Enable multiplications
        currentIndex = doMatch.end;
      }

      // Check for don't() instruction
      var dontMatch = dontRegExp.matchAsPrefix(corruptedMemory, currentIndex);
      if (dontMatch != null) {
        mulEnabled = false; // Disable multiplications
        currentIndex = dontMatch.end;
      }

      // If no matches found, move to the next character
      if (mulMatch == null && doMatch == null && dontMatch == null) {
        currentIndex++;
      }
    }

    // Output the total sum
    print('Total sum of enabled multiplications: $totalSum');
  } catch (e) {
    print('Error reading file: $e');
  }
}
