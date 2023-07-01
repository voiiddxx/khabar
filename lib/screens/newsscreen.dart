import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khabar/backend/fetch.dart';
import 'package:khabar/components/appbarfile.dart';
import 'package:khabar/components/newscard.dart';
import 'package:khabar/components/searchbar.dart';
import 'package:khabar/screens/sports.dart';
import 'package:khabar/utils/colorsfile.dart';
import 'package:khabar/utils/renderimage.dart';
import 'package:khabar/utils/textfile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  static TextEditingController search = TextEditingController();
  late Future<List> news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApi();
    news = fetchApi();
  }

  _launch(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
    throw "sorry i cant launch $url";
  }

  @override
  Widget build(BuildContext context) {
    String value;

    return Scaffold(
      appBar: reusable().ReusableAPPbar(),
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Searchfeild(),
            const SizedBox(
              height: 20,
            ),
            const Modifeidtext(
                text: "Category",
                size: 16,
                colors: Color.fromARGB(255, 165, 165, 165)),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8)),
                    child: const BoldText(
                        colors: Colors.black, size: 15, text: "Genral"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SportsScreen(aise: "entertainment");
                      }));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 17, 17, 17),
                          borderRadius: BorderRadius.circular(8)),
                      child: const BoldText(
                          colors: Colors.white,
                          size: 15,
                          text: "Entertainment"),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),

                  /////////////===========================sports============////////////
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SportsScreen(aise: "sports");
                      }));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 17, 17, 17),
                          borderRadius: BorderRadius.circular(8)),
                      child: const BoldText(
                          colors: Colors.white, size: 15, text: "Sports"),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SportsScreen(aise: "science");
                      }));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 17, 17, 17),
                          borderRadius: BorderRadius.circular(8)),
                      child: const BoldText(
                          colors: Colors.white, size: 15, text: "Science"),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SportsScreen(aise: "business");
                      }));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 17, 17, 17),
                          borderRadius: BorderRadius.circular(8)),
                      child: const BoldText(
                          colors: Colors.white, size: 15, text: "Business"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List>(
                future: fetchApi(),
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
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.yellow,
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
