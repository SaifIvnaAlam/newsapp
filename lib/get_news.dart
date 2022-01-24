import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getNews() async {
  var url =
      'https://newsapi.org/v2/everything?q=bangladesh&sortBy=publishedAt&apiKey=1fdbf3a957d243798ae1815c6ae997f5';
  var response = await http.get(Uri.parse(url));
  var data = response.body;
  Map dataMap = jsonDecode(data);
  return dataMap['articles'];
}
