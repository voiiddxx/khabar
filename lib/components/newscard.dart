import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khabar/utils/textfile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colorsfile.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String imageurl;
  final String Readurl;
  final String description;

  const NewsCard(
      {super.key,
      required this.title,
      required this.imageurl,
      required this.Readurl,
      required this.description});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(bottom: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Image.network(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 50, top: 5, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldText(colors: Colors.white, size: 15, text: title),
                    Modifeidtext(
                        text: description, size: 15, colors: Colors.grey),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 45,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final url = Uri.parse(Readurl);
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        // ignore: sort_child_properties_last
                        child: Text(
                          "Read More",
                          style: GoogleFonts.lato(
                              color: Colors.black, fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: AppColors.primary),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
