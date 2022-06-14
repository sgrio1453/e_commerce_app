import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/bilesenler/urunKontrol.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:e_ticaret/sayfa/indic.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompassPage extends StatefulWidget {
  String urunBaslik;

  CompassPage(this.urunBaslik);

  @override
  State<CompassPage> createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  int kapasiteSec = 8;

  List<int> kapasite = [8, 16, 32];
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
                        etiket("Tarihi eser"),
                        SizedBox(
                          height: 25,
                        ),
                        Center(child: Image.asset("assets/images/compass.png")),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Kapasite",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF0A1034)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: kapasite
                              .map((int number) => kapasiteSecenek(
                                      number, kapasiteSec == number, () {
                                    setState(() {
                                      kapasiteSec = number;
                                    });
                                  }))
                              .toList(),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        buildbilgi(),
                        SizedBox(
                          height: 32,
                        ),
                        buildbilgii(),
                        SizedBox(
                          height: 32,
                        ),
                        GrafikCompass(),
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
              padding:
                  EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color(0XFFECEFF1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
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
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 10),
                    child: Text(
                      "${urunToplamHesapla(popurun.miktar.toInt(), 400)} \₺",
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
        ));
  }

  int urunToplamHesapla(int miktar, int fiyat) {
    int toplamFiyat = miktar * fiyat;
    return toplamFiyat;
  }
}

Widget kapasiteSecenek(int kapasite, bool sec, var onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$kapasite mb",
        style: TextStyle(
            color: Color(sec ? 0XFF0001FC : 0XFFA7A9BE), fontSize: 16),
      ),
    ),
  );
}

Widget buildbilgi() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Anakartında sorun yoktur, ramlari değişmiştir, macun bakımı yapılmıştır, kapak kısmında boya vardır.",
      style: TextStyle(
          fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildbilgii() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "NOT: COUNTER 1.6 AÇMAZ!!!",
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}

class GrafikCompass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GrafikCompassState();
}

class GrafikCompassState extends State {
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
                      text: 'KDV',
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
                      text: 'Trt Payı ve Kültür bakanlığı vergisi',
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
                      text: 'Laptobun maliyeti',
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
