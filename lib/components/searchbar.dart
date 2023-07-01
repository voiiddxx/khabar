import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khabar/backend/fetch.dart';

import '../utils/colorsfile.dart';

class Searchfeild extends StatefulWidget {
  const Searchfeild({super.key});
  static TextEditingController searchcontroller =
      TextEditingController(text: ' ');

  @override
  State<Searchfeild> createState() => _SearchfeildState();
}

class _SearchfeildState extends State<Searchfeild> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: Searchfeild.searchcontroller,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: "Search Using Keywords",
              hintStyle: const TextStyle(
                  color: const Color.fromARGB(255, 165, 165, 165),
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: const Color.fromARGB(255, 17, 17, 17),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: InkWell(
            onTap: () {
              Focus.of(context).unfocus();
              fetchApi();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
