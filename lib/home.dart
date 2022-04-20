import 'package:e_mahsul_flutter/categories.dart';
import 'package:e_mahsul_flutter/components/bottomNavigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //-------------------- Baslik ---------------- //
                  buildBaslik(),

                  //-------------------- banner ---------------- //

                  //-------------------- butonlar ---------------- //
                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //ilk eleman
                        buildNavigation(
                            text: "Kategori",
                            icon: Icons.menu,
                            widget: CategoriesPages(),
                            context: context),
                        buildNavigation(
                            text: "Favori", icon: Icons.star_border),
                        buildNavigation(
                            text: "Blog", icon: Icons.notifications_none),
                        buildNavigation(
                            text: "çok satanlar", icon: Icons.people),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),
                  //-------------------- ilanlar ---------------- //
                  Text(
                    "Öne Çıkanlar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0A1034)),
                  ),
                  SizedBox(height: 16),

                  //-------------------- ilan elemanları
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildItems("Çilek Reçeli", "assets/images/recel.jpg",
                          "-50%", screenwidth),
                      buildItems("Çilek Reçeli", "assets/images/recel.jpg",
                          "-50%", screenwidth),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildItems("Çilek Reçeli", "assets/images/recel.jpg",
                          "-50%", screenwidth),
                      buildItems("Çilek Reçeli", "assets/images/recel.jpg",
                          "-50%", screenwidth),
                    ],
                  ),
                ],
              ),
            ),

            //-------------------- Button navigatörler ---------------- //
            bottomNavigationBar("home"),

          ],
        ),
      ),
    );
  }
}

//------------------------ Alt Navigat Buton -------------------//

//------------------------ Baslik -------------------//
Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Anasayfa",
      style: TextStyle(
        fontSize: 28,
        color: Color(0xFF0D450A),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

//------------------------ Sayfa geçiş -------------------//
Widget buildNavigation({
  required String text,
  required IconData icon,
  widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(
            icon,
            color: Color(0xFF0D450A),
            size: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF0D450A),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

//------------------------ Satiş ilanları -------------------//
Widget buildItems(@required String text, @required String photoUrl,
    @required String yuzdelik, @required double screenwidth) {
  return Container(
    width: (screenwidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //%50
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2), color: Color(0xFFE0ECF8)),
          child: Text(
            yuzdelik,
            style: TextStyle(color: Color(0xFF2B6BD9), fontSize: 12),
          ),
        ),
        SizedBox(height: 22),
        //-------------------- İlan resmi
        Center(child: Image.asset(photoUrl)),

        SizedBox(height: 22),
        //-------------------- İlan Adı
        Center(
            child: Text(text,
                style: TextStyle(fontSize: 18, color: Color(0xFF032B71)))),
      ],
    ),
  );
}
