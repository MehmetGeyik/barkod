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
        child: Text(
          "Ana Sayfa",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blue[700],
    );
  }
}