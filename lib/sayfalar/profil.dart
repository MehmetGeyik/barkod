import 'package:barkod/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Sayfası",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: cikisYap)
        ],
      ),
      body: ListView(
        children: [
          _profilDetaylari()
        ],
      ),
      );
  }

  Widget _profilDetaylari(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 50.0,
            )
          ],
        )
      ],
    );
  }

  void cikisYap(){
    Provider.of<YetkilendirmeServisi>(context, listen: false).cikisYap();
  }
}