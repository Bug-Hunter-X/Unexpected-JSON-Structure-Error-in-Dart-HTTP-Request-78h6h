```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Check for key existence before accessing
      if (jsonData.containsKey('someKey')) {
        print(jsonData['someKey']);
      } else {
        print('Key "someKey" not found in JSON response.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // More specific error handling for JSON decoding failures
    if (e is FormatException) {
        print('Invalid JSON format');
    }
  }
}
```