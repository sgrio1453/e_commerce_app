import 'package:e_ticaret/bilesenler/currentWeather.dart';
import 'package:e_ticaret/bilesenler/ekBilgi.dart';
import 'package:e_ticaret/models/weatherModel.dart';
import 'package:e_ticaret/servis/weatherApi.dart';
import 'package:flutter/material.dart';

class Havapage extends StatefulWidget {
  const Havapage({Key? key}) : super(key: key);

  @override
  State<Havapage> createState() => _HavapageState();
}

class _HavapageState extends State<Havapage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  @override
  Future<void> getData() async {
    data = await client.getCurrentWeather("Konya");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: const Text("Hava Durumu"),
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(Icons.wb_sunny_rounded, "${data!.temp}°",
                      "${data!.cityname}"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ek bilgiler",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  ekBilgi("${data!.wind}", "${data!.humidity}",
                      "${data!.pressure}", "${data!.feels_like}"),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ));
  }
}
