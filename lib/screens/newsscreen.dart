import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:khabar/components/appbarfile.dart';
import 'package:khabar/utils/colorsfile.dart';
import 'package:khabar/utils/textfile.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  static TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusable().ReusableAPPbar(),
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 85, left: 20),
            child: TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 15),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.lightwhite,
                    size: 20,
                  ),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  fillColor: const Color.fromARGB(255, 22, 22, 22),
                  hintText: "Search Now",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 182, 182, 182), fontSize: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ],
      ),
    );
  }
}
