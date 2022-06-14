import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/bilesenler/urunKontrol.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sayfa/indic.dart';

class BenzinPage extends StatefulWidget {
  String urunBaslik;

  BenzinPage(this.urunBaslik);

  @override
  State<BenzinPage> createState() => _BenzinPageState();
}

class _BenzinPageState extends State<BenzinPage> {
  @override
  Widget build(BuildContext context) {
    Get.find<UrunKontrol>().tanimUrun();
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
                      etiket("O-bilet sponsorlu"),
                      SizedBox(
                        height: 25,
                      ),
                      Center(child: Image.asset("assets/images/benzinn.png")),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Açıklama: ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildbilgi(),
                      SizedBox(
                        height: 10,
                      ),
                      GrafikBenzin(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ])),
      bottomNavigationBar: GetBuilder<UrunKontrol>(
        builder: (popurun) {
          return Container(
            height: 120,
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Color(0XFFECEFF1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          popurun.miktarAyar(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        popurun.miktar.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          popurun.miktarAyar(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                  child: Text(
                    "${urunToplamHesapla(popurun.miktar.toInt(), 50)} \₺",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  int urunToplamHesapla(int miktar, int fiyat) {
    int toplamFiyat = miktar * fiyat;
    return toplamFiyat;
  }
}

Widget buildbilgi() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Arabanızla evin yanındaki markete gitmelik benzin",
      style: TextStyle(
          fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
  );
}

class GrafikBenzin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GrafikBenzinState();
}

class GrafikBenzinState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 28,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: [
                    Indicator(
                      color: const Color(0xff0293ee),
                      text: 'ÖTV',
                      isSquare: false,
                      size: touchedIndex == 0 ? 18 : 16,
                      textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Indicator(
                      color: const Color(0xfff8b250),
                      text: 'Dış minnahlar vergisi',
                      isSquare: false,
                      size: touchedIndex == 1 ? 18 : 16,
                      textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Indicator(
                      color: const Color(0xff845bef),
                      text: 'Pomba vergisi',
                      isSquare: false,
                      size: touchedIndex == 2 ? 18 : 16,
                      textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Indicator(
                      color: const Color(0xff13d38e),
                      text: 'Benzinin maliyeti',
                      isSquare: false,
                      size: touchedIndex == 3 ? 18 : 16,
                      textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 1,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;

        const color0 = Color(0xff0293ee);
        const color1 = Color(0xfff8b250);
        const color2 = Color(0xff845bef);
        const color3 = Color(0xff13d38e);

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: 65,
              title: '',
              radius: 80,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: Colors.black, width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1.withOpacity(opacity),
              value: 5,
              title: '',
              radius: 65,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: Colors.black, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color2.withOpacity(opacity),
              value: 25,
              title: '',
              radius: 60,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? BorderSide(color: Colors.black, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: color3.withOpacity(opacity),
              value: 5,
              title: '',
              radius: 70,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: Colors.black, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
