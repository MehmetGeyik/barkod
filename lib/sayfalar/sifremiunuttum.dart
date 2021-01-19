import 'package:barkod/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SifremiUnuttum extends StatefulWidget {
  @override
  _SifremiUnuttumState createState() => _SifremiUnuttumState();
}

class _SifremiUnuttumState extends State<SifremiUnuttum> {
   bool yukleniyor = false;
  final _formAnahtari = GlobalKey<FormState>();
  final _scaffoldAnahtari = GlobalKey<ScaffoldState>();
  String  email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldAnahtari,
      appBar: AppBar(
        title: Text("Şifremi Sıfırla") ,
      ),
      body: ListView(
        children: [
          yukleniyor ? LinearProgressIndicator() : SizedBox(height:0.0,),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formAnahtari,
              child: Column(
                children: [
                  
        
                  TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail adresinizi girin",
              labelText: "E-mail:",
              errorStyle: TextStyle(fontSize: 16.0),
              prefixIcon: Icon(Icons.mail),
            ),
            validator: (girilenDeger) {
              if (girilenDeger.isEmpty) {
                return "E-mail alanı boş bırakılamaz.";
              } else if (!girilenDeger.contains("@")) {
                return "Girilen değer mail formatında olmalı";
              }
              return null;
            },
            onSaved: (girilenDeger) => email = girilenDeger,
        ),
        
        SizedBox(height: 50.0,),
        Container(
            width: double.infinity,
            child: FlatButton(
                    onPressed: _sifreyiSifirla,
                    child: Text("Şifremi Sıfırla",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    color: Theme.of(context).primaryColor,
                  ),
        ),
                ],
              )),
          )
        ],
      )
    );
  }

  void _sifreyiSifirla() async {
    final _yetkilendirmeServisi = Provider.of<YetkilendirmeServisi>(context, listen: false);
    var _formState = _formAnahtari.currentState;
    if (_formState.validate()){
      _formState.save();
      setState(() {
      yukleniyor = true;  
      });
      try {
        await _yetkilendirmeServisi.sifremiSifirla(email);
        Navigator.pop(context);
      } catch(hata){
        setState(() {
          yukleniyor = false;
        });
        uyariGoster(hataKodu: hata.code);
      }
      
    }
  }
   uyariGoster({hataKodu}){
    String hataMesaji;
    if(hataKodu == "invalid-email"){
      hataMesaji = "Girdiğiniz mail adresi geçersizdir";
      } else if (hataKodu == "user-not-found") {
      hataMesaji = "Bu mailde bir kullanıcı bulunmuyor";
      }
      var snackBar = SnackBar(content:  Text(hataMesaji));
       _scaffoldAnahtari.currentState.showSnackBar(snackBar); 
       
  }
}