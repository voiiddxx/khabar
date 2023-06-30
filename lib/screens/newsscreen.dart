import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:khabar/backend/fetch.dart';
import 'package:khabar/components/appbarfile.dart';
import 'package:khabar/components/searchbar.dart';
import 'package:khabar/utils/colorsfile.dart';
import 'package:khabar/utils/renderimage.dart';
import 'package:khabar/utils/textfile.dart';

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
            Row(
              children: [
                Expanded(
                  child: Searchfeild(),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
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
                        return Container(
                          child: Text(
                            snapshot.data![index]['title'],
                            style: TextStyle(color: Colors.white),
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
