import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../model/news_model.dart';

List<String> listOfCategory = [
  "all",
  "national",
  "business",
  "sports",
  "world",
  "politics",
  "technology",
  "startup",
  "entertainment",
  "miscellaneous",
  "hatke",
  "science",
  "automobile",
];

class MyApiService {
  String BASE_URL = 'https://inshorts.deta.dev/news?category=';

  Future<NewsData?> apiGet(int catIndex) async {
    NewsData? newsData;

    final response = await http.get(Uri.parse(BASE_URL + listOfCategory[0]));

    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> bodyData = jsonDecode(response.body);
        newsData = NewsData.fromJson(bodyData);

        log(newsData.success.toString());
      } catch (e) {
        log(e.toString());
      }
    } else {
      return null;
    }

    // log(newsData.data!.length.toString());

    return newsData;
  }
}
