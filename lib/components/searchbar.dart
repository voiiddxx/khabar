import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Searchfeild extends StatelessWidget {
  const Searchfeild({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      style: TextStyle(color: Colors.white, fontSize: 15),
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
        fillColor: Color.fromARGB(255, 17, 17, 17),
      ),
    );
  }
}
