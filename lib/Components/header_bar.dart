import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  double width;
  List list;

  HeaderBar({required this.width, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100,
      margin: const EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFebf8fd),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(list[0]['img']),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list[0]['name'].toString(),
                  style: TextStyle(
                      color: Color(0xFF3b3f42),
                      fontSize: 18,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Top Level",
                  style: TextStyle(
                      color: Color(0xFFfdebb2),
                      fontSize: 12,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            Expanded(child: Container()),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFf3fafc)),
              child: Center(
                child: Icon(
                  Icons.notifications,
                  color: Color(0xFF69c5df),
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
