import 'package:barkod/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';


class AnaSayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<AnaSayfa> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(onTap: () => YetkilendirmeServisi().cikisYap(),
                  child: Text(
            "Çıkış yap",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.blue[700],
    );
  }
}