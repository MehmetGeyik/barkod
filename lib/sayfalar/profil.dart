import 'package:barkod/modeller/kullanici.dart';
import 'package:barkod/sayfalar/profiliduzenle.dart';
import 'package:barkod/servisler/firestoreservisi.dart';
import 'package:barkod/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  final String profilSahibiId;

  const Profil({Key key, this.profilSahibiId}) : super(key: key);
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Kullanici _profilSahibi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Sayfası",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[100],
        actions: [
          _profiliDuzenleButon(),
          IconButton(icon: Icon(Icons.exit_to_app,color: Colors.black,), onPressed: cikisYap)
        ],
      ),
      body: FutureBuilder<Object>(
        future: FireStoreServisi().kullaniciGetir(widget.profilSahibiId),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          _profilSahibi = snapshot.data;
          return ListView(
            children: [_profilDetaylari(snapshot.data)],
          );
        }
      ),
    );
  }

  Widget _profilDetaylari(Kullanici profilData) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 50.0,
                backgroundImage: profilData.fotoUrl.isNotEmpty ? NetworkImage(profilData.fotoUrl) : AssetImage("assets/images/avatar.png"),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      profilData.kullaniciAdi,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                          ),
                    ),
                    
                  ],
                ),
              ), 
            ],
          ),
          SizedBox(width: 10.0,height: 5.0,),
                    Text(profilData.hakkinda,
                    style: TextStyle(
                      fontSize: 15.0,
                    )
                    )
          
        ],
      ),
    );
  }
   Widget _profiliDuzenleButon(){
     return IconButton(icon: Icon(Icons.settings, color: Colors.black,), onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfiliDuzenle(profil: _profilSahibi,)));
     },);
  }

  void cikisYap() {
    Provider.of<YetkilendirmeServisi>(context, listen: false).cikisYap();
  }
}
