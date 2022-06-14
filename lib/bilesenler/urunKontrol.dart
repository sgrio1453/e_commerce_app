import 'package:e_ticaret/bilesenler/urunDepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UrunKontrol extends GetxController {
  int _fiyat = 0;
  int _miktar = 0;
  final UrunDepo urunDepo;

  UrunKontrol({required this.urunDepo});

  List<dynamic> _urunList = [];
  List<dynamic> get urunList => _urunList;

  int get miktar => _miktar;
  int get fiyat => fiyat;

  void miktarAyar(bool artis) {
    if (artis) {
      _miktar = miktarKontrol(_miktar + 1);
    } else {
      _miktar = miktarKontrol(_miktar - 1);
    }
    update();
  }

  int miktarKontrol(int miktar) {
    if (miktar < 0) {
      Get.snackbar("Ürün miktarı", "Sıfırın altında sayı yok!!!",
          backgroundColor: Colors.blueGrey, colorText: Colors.white);
      return 0;
    } else if (miktar > 10) {
      Get.snackbar("Ürün miktarı", "Torbayla almıyoruz bizde de az var!!!",
          backgroundColor: Colors.blueGrey, colorText: Colors.white);
      return 10;
    } else {
      return miktar;
    }
  }

  void tanimUrun() {
    _miktar = 0;
  }

  int urunlerFiyatHesapla(int ucret, int yeniMiktar) {
    int toplam = ucret * yeniMiktar;
    return toplam;
  }
}
