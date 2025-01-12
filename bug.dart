```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success! Parse the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data from jsonData.  Error may occur here if the JSON structure is unexpected
      print(jsonData['someKeyThatMightNotExist']); // potential error
    } else {
      // Handle error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions, including JSON decoding errors
    print('Error: $e');
  }
}
```