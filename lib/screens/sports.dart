// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:khabar/components/newscard.dart';
import 'package:khabar/components/searchbar.dart';
import 'package:khabar/utils/colorsfile.dart';
import 'package:khabar/utils/keyfile.dart';
import 'package:khabar/utils/textfile.dart';
import 'package:http/http.dart' as http;

import '../components/appbarfile.dart';
import '../utils/renderimage.dart';

class SportsScreen extends StatefulWidget {
  final String aise;
  const SportsScreen({
    Key? key,
    required this.aise,
  }) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState(aise);
}

class _SportsScreenState extends State<SportsScreen> {
  final String aise;
  _SportsScreenState(this.aise);

  Future<List> Categorynews() async {
    final res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$aise"
                "&pageSize=100&apiKey=" +
            apikey.key +
            '&q=' +
            Searchfeild.searchcontroller.text));
    Map result = jsonDecode(res.body);
    return (result['articles']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Categorynews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusable().ReusableAPPbar(),
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Searchfeild(),
            const SizedBox(
              height: 30,
            ),
            BoldText(text: aise, size: 18, colors: AppColors.primary),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: FutureBuilder(
                future: Categorynews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                            title: snapshot.data![index]['title'],
                            imageurl:
                                snapshot.data![index]['urlToImage'] != null
                                    ? snapshot.data![index]['urlToImage']
                                    : RenderImages.imageurl,
                            Readurl: snapshot.data![index]['url'],
                            description:
                                snapshot.data![index]['desciption'].toString());
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      backgroundColor: AppColors.black,
                      strokeWidth: 1,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
