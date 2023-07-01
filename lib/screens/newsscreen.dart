import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khabar/backend/fetch.dart';
import 'package:khabar/components/appbarfile.dart';
import 'package:khabar/components/searchbar.dart';
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
    return Scaffold(
      appBar: reusable().ReusableAPPbar(),
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Searchfeild(),
            SizedBox(
              height: 20,
            ),
            Modifeidtext(
                text: "Category",
                size: 16,
                colors: Color.fromARGB(255, 165, 165, 165)),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8)),
                  child:
                      BoldText(colors: Colors.black, size: 15, text: "Genral"),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 17, 17, 17),
                      borderRadius: BorderRadius.circular(8)),
                  child:
                      BoldText(colors: Colors.white, size: 15, text: "Primary"),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 17, 17, 17),
                      borderRadius: BorderRadius.circular(8)),
                  child:
                      BoldText(colors: Colors.white, size: 15, text: "Sports"),
                ),
              ],
            ),
            SizedBox(
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
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 6, bottom: 10),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 30),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width: double.infinity,
                                  child: Image.network(
                                    snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : RenderImages.imageurl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 50, top: 5, bottom: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BoldText(
                                            colors: Colors.white,
                                            size: 15,
                                            text: snapshot.data![index]
                                                ['title']),
                                        Modifeidtext(
                                            text: snapshot.data![index]
                                                    ['description']
                                                .toString(),
                                            size: 15,
                                            colors: Colors.grey),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: 130,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              try {
                                                final url = Uri.parse(snapshot
                                                    .data![index]['url']);
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url);
                                                }
                                              } catch (e) {
                                                print(e.toString());
                                              }
                                            },
                                            child: Text(
                                              "Read More",
                                              style: GoogleFonts.lato(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                backgroundColor:
                                                    AppColors.primary),
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
                      },
                    );
                  }
                  return Center(
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
