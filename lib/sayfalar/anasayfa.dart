import 'package:barkod/sayfalar/kasa.dart';
import 'package:barkod/sayfalar/profil.dart';
import 'package:barkod/sayfalar/satis.dart';
import 'package:barkod/sayfalar/urun.dart';
import 'package:barkod/sayfalar/yukle.dart';
import 'package:barkod/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';


class AnaSayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<AnaSayfa> {
  int _aktifSayfaNo =0;
  PageController sayfaKumandasi;

  @override
  void initState() {
    super.initState();
    sayfaKumandasi = PageController();
  }
  @override
  void dispose() {
    sayfaKumandasi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (acilanSayfaNo){
          setState(() {
            _aktifSayfaNo = acilanSayfaNo;
          });
        },
        controller: sayfaKumandasi,
        children: [
          Urun(),
          Yukle(),
          Satis(),
          Kasa(),
          Profil(),
        ],
      ),
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: _aktifSayfaNo,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey[600],
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ürün"),
            BottomNavigationBarItem(icon: Icon(Icons.file_upload), label: "Yükle"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Satış"),
            BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: "Kasa"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),


          ],
          onTap: (secilenSayfaNo){
            setState(() {
              sayfaKumandasi.jumpToPage(secilenSayfaNo);
            });

          },
          ),
    );
  }
}