import 'package:flutter/material.dart';

Widget bottomNavigationBar(String page) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -3),
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10)
          ],
          color: Color(0xFFB9BFD5),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon(Icons.home_filled, page == "home"),
            buildNavIcon(Icons.search, page == "search"),
            buildNavIcon(Icons.shopping_basket, page == "basket"),
            buildNavIcon(Icons.person, page == "person"),
          ],
        )),
  );
}

Widget buildNavIcon(@required IconData iconData, @required bool active) {
  return Icon(iconData,
      size: 25, color: Color(active ? 0xFF188216 : 0xFFFFFFFF));
}