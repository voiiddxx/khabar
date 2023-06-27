import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Modifeidtext extends StatelessWidget {
  final String text;
  final double size;
  final Color colors;

  const Modifeidtext(
      {super.key,
      required this.text,
      required this.size,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: colors, fontSize: size),
    );
  }
}

//======bold text utils======/
class BoldText extends StatelessWidget {
  final String text;
  final Color colors;
  final double size;

  const BoldText({
    super.key,
    required this.colors,
    required this.size,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          color: colors, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
