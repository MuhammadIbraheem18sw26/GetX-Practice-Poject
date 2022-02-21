import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: Color(0xffcbe6f6),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < info.length; i++)
                    Container(
                      height: 320,
                      child: GestureDetector(
                        onTap: () {
                          print('Click');
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          height: 220,
                          width: MediaQuery.of(context).size.width - 20,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: i.isEven
                                  ? Color(0xFF69c5df)
                                  : Color(0xFF9294cc)),
                          child: Column(
                            children: [
                              Container(
                                  child: Row(
                                children: [
                                  Text(
                                    info[i]['title'].toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Expanded(child: Container())
                                ],
                              )),
                              SizedBox(height: 10),
                              Container(
                                width: width,
                                child: Text(
                                  info[i]['text'].toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xFFb8eefc)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                thickness: 1.0,
                              ),
                              Row(children: [
                                for (int i = 0; i < 4; i++)
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  info[i]['img'].toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                  )
                              ]),
                            ],
                          ),
                        ),
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
