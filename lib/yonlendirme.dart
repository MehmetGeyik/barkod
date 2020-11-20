import 'package:barkod/modeller/kullanici.dart';
import 'package:barkod/sayfalar/anasayfa.dart';
import 'package:barkod/sayfalar/girissayfasi.dart';
import 'package:flutter/material.dart';
import 'package:barkod/servisler/yetkilendirmeservisi.dart';
import 'package:provider/provider.dart';

class Yonlendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _yetkilendirmeServisi = Provider.of<YetkilendirmeServisi>(context, listen: false);
    
    return StreamBuilder(
      stream: _yetkilendirmeServisi.durumTakipcisi,
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if(snapshot.hasData){ 
          Kullanici aktifKullanici = snapshot.data;
          return AnaSayfa();
        } else {
          return GirisSayfasi();
        }

      }
      );
  }
}
