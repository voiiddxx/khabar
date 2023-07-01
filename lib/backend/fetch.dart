import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:khabar/components/searchbar.dart';
import 'package:khabar/utils/keyfile.dart';

Future<List> fetchApi() async {
  final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=" +
          apikey.key +
          '&q=' +
          Searchfeild.searchcontroller.text));
  Map result = jsonDecode(response.body);
  print(response.body);
  return (result['articles']);
}
