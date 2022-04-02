import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:flutter/material.dart';

class BarbiePage extends StatefulWidget {
  String urunBaslik;

  BarbiePage(this.urunBaslik);

  @override
  State<BarbiePage> createState() => _BarbiePageState();
}

class _BarbiePageState extends State<BarbiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //baslik
            baslik(widget.urunBaslik, context),
            SizedBox(height: 32),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: [
                    etiket("Oyuncaktır!!!"),
                    SizedBox(
                      height: 25,
                    ),
                    Center(child: Image.asset("assets/images/barbie.png")),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Açıklama: ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF0A1034)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    buildbilgi(),
                    buildbilgii(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ])));
  }
}

Widget buildbilgi() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Barbie sesli oyuncak telefon; basmatikli, kulağa götürülebilir, gerçek arama yapmaz ya da biri sizi arayamaz fakat hayali olarak konuşabilirsiniz.",
      style: TextStyle(
          fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildbilgii() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "NOT: STOKTA YOKTUR",
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
