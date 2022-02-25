import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/card_component.dart';

import 'my_detail_page.dart';

class RecentContext extends StatefulWidget {
  static String recentContext = "/recentcontext/";

  @override
  State<RecentContext> createState() => _RecentContextState();
}

class _RecentContextState extends State<RecentContext> {
  List info = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/detail.json')
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF69c5df),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Color(0xffcbe6f6),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < info.length; i++)
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      height: 320,
                      child: GestureDetector(
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
                      ),
                    )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
