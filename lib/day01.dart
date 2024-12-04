import 'package:advent_of_code/utils.dart';

main() async {
  // DAY 1
  try {
    // Read the file as a string
    String fileContent1 = await readFiles('inputs/day01/numbers1.txt');
    String fileContent2 = await readFiles('inputs/day01/numbers2.txt');

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
