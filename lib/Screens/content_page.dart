import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/Screens/recent_context.dart';
import 'package:get/get.dart';
import '../Components/card_component.dart';
import '../Components/header_bar.dart';

import 'my_detail_page.dart';

class ContentPage extends StatefulWidget {
  static String contentPage = '/content/';

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List list = [];
  List info = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/recent.json")
        .then((value) {
      setState(() {
        list = jsonDecode(value);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/detail.json")
        .then((value) {
      setState(() {
        info = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: Color(0xFFc5e5f3),
        child: Column(
          children: [
            //james smith
            HeaderBar(width: width, list: info),
            SizedBox(
              height: 30,
            ),
            //popular contest
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    "Popular Contest",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //list
            Container(
              height: 250,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.88),
                  itemCount: info.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(DetailPage.detail, arguments: {
                          'name': info[i]['name'].toString(),
                          'title': info[i]['title'].toString(),
                          'prize': info[i]['prize'].toString(),
                          'time': info[i]['time'].toString(),
                          'text': info[i]['text'].toString(),
                          'img': info[i]['img'].toString(),
                        });
                      },
                      child: Cards(index: i, list: info, width: width),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            //recent contests
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    "Recent Contests",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Show all",
                    style: TextStyle(
                        color: Color(0xFFfdc33c),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFfdc33c)),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => RecentContext());
                      },
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: width,
                            height: 100,
                            margin: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFebf8fd),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage(list[index]['img']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index]['status'],
                                        style: TextStyle(
                                            color: Colors.orangeAccent,
                                            fontSize: 18,
                                            decoration: TextDecoration.none),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          width: 120,
                                          child: Text(
                                            list[index]['text'],
                                            style: TextStyle(
                                                color: Color(0xFF3b3f42),
                                                fontSize: 18,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: Text(
                                      list[index]['time'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          decoration: TextDecoration.none,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }))),
          ],
        ),
      ),
    );
  }
}
