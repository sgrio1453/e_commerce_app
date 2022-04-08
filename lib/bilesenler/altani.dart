import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_ticaret/arama.dart';
import 'package:e_ticaret/home.dart';
import 'package:e_ticaret/profil.dart';
import 'package:flutter/material.dart';

class AlttaraffPage extends StatefulWidget {
  const AlttaraffPage({Key? key}) : super(key: key);

  @override
  State<AlttaraffPage> createState() => _AlttaraffPageState();
}

class _AlttaraffPageState extends State<AlttaraffPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    HomePage(),
    Aramapage(),
    ProfilPage(),
  ];
  @override
  Widget build(BuildContext context) {
    //İkonlar
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.search,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      )
    ];
    //özellikleri
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          body: screens[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.blue,
              buttonBackgroundColor: Colors.blueGrey,
              backgroundColor: Colors.transparent,
              height: 60,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 300),
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
