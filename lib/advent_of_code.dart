import 'dart:io';

import './utils.dart';

int calculate() {
  return 6 * 7;
}

// Part2 Day2
// Function to check if removing one level makes the report safe
bool canBeMadeSafeByRemovingOneLevel(List<int> report) {
  // Try removing one level at a time
  for (int i = 0; i < report.length; i++) {
    // Create a new report without the i-th level
    List<int> newReport = List.from(report)..removeAt(i);

    // Check if the new report is safe
    if (isSafe(newReport)) {
      return true;  // If any new report is safe, return true
    }
  }
  return false;  // If no safe report can be formed by removing one level, return false
}

// Part1 Day2
// Function to check if a report is safe
bool isSafe(List<int> report) {
  bool? isIncreasing = null;  // To track if the levels are increasing or decreasing
  for (int i = 0; i < report.length - 1; i++) {
    int diff = report[i + 1] - report[i];
    
    // Check if the difference is within the allowed range
    if (diff.abs() < 1 || diff.abs() > 3) {
      return false;  // Unsafe if the difference is not within 1 to 3
    }

    // Check the increasing/decreasing pattern
    if (isIncreasing == null) {
      isIncreasing = diff > 0;
    } else if (isIncreasing != (diff > 0)) {
      return false;  // Unsafe if the trend changes (from increasing to decreasing or vice versa)
    }
  }
  return true;
}

day2() async {
  var file = File('inputs/day2/reports.txt');

  // Read lines from the file asynchronously
  try {
    List<String> lines = await file.readAsLines();

    // Convert the lines to a list of reports, each being a List<int>
    List<List<int>> reports = lines.map((line) {
      return line.split(' ').map(int.parse).toList();
    }).toList();

    // Check each report and count the safe reports
    int safeReportsCount = 0;
    for (var report in reports) {
      if (isSafe(report)|| canBeMadeSafeByRemovingOneLevel(report)) {
        safeReportsCount++;
      }
    }

    // Output the number of safe reports
    print('Number of safe reports: $safeReportsCount');
  } catch (e) {
    print('Error reading file: $e');
  }
}

day1() async {
  // DAY 1
  try {
    // Read the file as a string
    String fileContent1 = await readFiles('inputs/day1/numbers1.txt');
    String fileContent2 = await readFiles('inputs/day1/numbers2.txt');

    // Split the content into individual numbers (assuming numbers are space-separated or on separate lines)
    List<String> stringList1 = fileContent1
        .split(RegExp(r'\s+')); // Split by any whitespace (space, newline, tab)
    List<String> stringList2 = fileContent2
        .split(RegExp(r'\s+')); // Split by any whitespace (space, newline, tab)

    // Convert the list of strings into a list of integers
    List<int> list1 = stringList1.map(int.parse).toList();
    List<int> list2 = stringList2.map(int.parse).toList();

    // Sort both lists
    list1.sort();
    list2.sort();

    // Check if the lists have the same length
    if (list1.length != list2.length) {
      print(
          'The lists have different lengths and cannot be compared element-wise.');
      return;
    }

    // Calculate the difference between corresponding values
    List<int> differences = [];
    for (int i = 0; i < list1.length; i++) {
      differences.add((list1[i] - list2[i]).abs());
    }

    int sumOfDifferences = differences.reduce((a, b) => a + b);

    // part 2
    // Initialize a map to store the results of how many times each number in list1 appears in list2
    Map<int, int> countMap = {};

    // Count how many times each number in list1 appears in list2
    for (int num in list1) {
      int count = list2.where((element) => element == num).length;
      countMap[num] = count;
    }

    // Calculate the sum of number * count for each number in list1
    int weightedSum = 0;
    for (int num in countMap.keys) {
      weightedSum += num * countMap[num]!;
    }

    print('Sum of differences: $sumOfDifferences');
    print('Weighted sum (number * count): $weightedSum');
  } catch (e) {
    print('Error executing: $e');
  }
}
