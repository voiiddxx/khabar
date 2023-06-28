import 'package:flutter/material.dart';

import '../utils/colorsfile.dart';
import '../utils/textfile.dart';

class reusable {
  ReusableAPPbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      title: const BoldText(
          colors: const Color.fromARGB(255, 255, 237, 78),
          size: 18,
          text: "Kharbar"),
      titleSpacing: 5,
      leading: Icon(
        Icons.now_widgets_sharp,
        color: AppColors.lightwhite,
      ),
      actions: [
        Icon(
          Icons.notifications_active,
          color: AppColors.primary,
        ),
        SizedBox(
          width: 25,
        ),
      ],
    );
  }
}
