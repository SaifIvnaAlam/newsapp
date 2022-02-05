import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_response.dart';

Future<AutoGenerate> getNews(String searchQuery) async {
  var url =
      'https://newsapi.org/v2/everything?q=$searchQuery&from=2022-01-06&sortBy=publishedAt&apiKey=1fdbf3a957d243798ae1815c6ae997f5';
  var response = await http.get(Uri.parse(url));
  var data = response.body;
  Map dataMap = jsonDecode(data);
  print(searchQuery);

  return AutoGenerate.fromJson(dataMap as Map<String, dynamic>);
}
