// Part2 Day2
// Function to check if removing one level makes the report safe
import 'dart:io';

bool canBeMadeSafeByRemovingOneLevel(List<int> report) {
  // Try removing one level at a time
  for (int i = 0; i < report.length; i++) {
    // Create a new report without the i-th level
    List<int> newReport = List.from(report)..removeAt(i);

    // Check if the new report is safe
    if (isSafe(newReport)) {
      return true; // If any new report is safe, return true
    }
  }
  return false; // If no safe report can be formed by removing one level, return false
}

// Part1 Day2
// Function to check if a report is safe
bool isSafe(List<int> report) {
  bool? isIncreasing; // To track if the levels are increasing or decreasing
  for (int i = 0; i < report.length - 1; i++) {
    int diff = report[i + 1] - report[i];

    // Check if the difference is within the allowed range
    if (diff.abs() < 1 || diff.abs() > 3) {
      return false; // Unsafe if the difference is not within 1 to 3
    }

    // Check the increasing/decreasing pattern
    if (isIncreasing == null) {
      isIncreasing = diff > 0;
    } else if (isIncreasing != (diff > 0)) {
      return false; // Unsafe if the trend changes (from increasing to decreasing or vice versa)
    }
  }
  return true;
}

main() async {
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
      if (isSafe(report) || canBeMadeSafeByRemovingOneLevel(report)) {
        safeReportsCount++;
      }
    }

    // Output the number of safe reports
    print('Number of safe reports: $safeReportsCount');
  } catch (e) {
    print('Error reading file: $e');
  }
}
