import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'content_page.dart';
import 'my_detail_page.dart';
import 'my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.homepage,
      getPages: [
        GetPage(name: MyHomePage.homepage, page: () => MyHomePage()),
        GetPage(name: ContentPage.contentPage, page: () => ContentPage()),
        GetPage(name: DetailPage.detail, page: () => DetailPage()),
      ],
    );
  }
}
