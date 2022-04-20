import 'package:flutter/material.dart';

import 'components/header.dart';
import 'components/label.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedCapacity = 20;
  List<int> capacities = [20, 30, 40];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //------------ ------- - - Başlık-------------- //
            header(widget.productTitle, context),
            SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  //------------------------  Yeni  Etiketi ----------------------//
                  label("Yeni"),
                  SizedBox(height: 25),

                  //------------------------  Ürün Fotoğrafı ----------------------//
                  Image.asset("assets/images/beyaz.jpg"),

                  SizedBox(height: 30),

                  //------------------------  Seçenek Miktarı -------------------------------//
                  Text(
                    "Seçenek (Kg)",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF131553)),
                  ),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: capacities
                        .map((int number) => capacityOptions(
                            capacity: number,
                            selected: selectedCapacity == number,
                            onTap: () {
                              setState(() {
                                selectedCapacity = number;
                              });
                            })).toList(),
                  ),

                  //------------------------  Sepete Ekle Butonu ----------------------//

                ],
              ),
            ),
          ]))
    ])));
  }
}

Widget capacityOptions({required int capacity, required bool selected,  required Function onTap}) => GestureDetector(
    onTap : () {onTap;},
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$capacity Kg",
        style: TextStyle(
          color: Color(selected ? 0xFF175DDB : 0xFF6E6E74),
          fontSize: 16
        ),
      ),
    ),
  );
