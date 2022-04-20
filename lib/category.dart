import 'package:e_mahsul_flutter/components/bottomNavigation.dart';
import 'package:e_mahsul_flutter/components/header.dart';
import 'package:e_mahsul_flutter/productDetail.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;

  CategoryPage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Kars Peyniri",
      "Fotograf": "assets/images/beyaz.jpg",
      "Fiyat": "50"
    },
    {"isim": "Keçi Sütü", "Fotograf": "assets/images/beyaz.jpg", "Fiyat": "20"},
    {
      "isim": "Otlu Peynir",
      "Fotograf": "assets/images/beyaz.jpg",
      "Fiyat": "50"
    },
    {"isim": "Peynir", "Fotograf": "assets/images/beyaz.jpg", "Fiyat": "15"},
    {"isim": "Peynir", "Fotograf": "assets/images/beyaz.jpg", "Fiyat": "30"},
    {"isim": "Peynir", "Fotograf": "assets/images/beyaz.jpg", "Fiyat": "30"},
    {"isim": "Peynir", "Fotograf": "assets/images/beyaz.jpg", "Fiyat": "30"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //------------ ------- - - header -------------- //

          header(categoryTitle, context),
          SizedBox(height: 32),

          // - -------------------- içerikler --------------- //
          //buildContent("beyaz peynir", "assets/images/beyaz.jpg", "50"),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              children: products.map((Map product) {
                return buildContent(product["isim"], product["Fotograf"],
                    product["Fiyat"], context);
              }).toList(),
            ),
          )
        ]),
      ),

      // Bottom navigation

      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Image.asset(
            photoUrl,
            height: 90,
            width: 120,
            fit: BoxFit.fitWidth,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF071026),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "$price  ₺",
                style: TextStyle(
                    color: Color(0xFF102A5C),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
