import 'dart:io';

Future<String> readFiles(String fp) async {
  var currentDirectory = Directory.current;
  print('Current directory: ${currentDirectory.path}');
  var filePath = currentDirectory.uri.resolve(fp).toFilePath();

  try {
    var input = File(filePath);
    // Read the file as a string
    String fileContent = await input.readAsString();
    return fileContent;
  } catch (e) {
    print('Error reading file: $e');
    throw Exception('Failed to read file');
  }
}
