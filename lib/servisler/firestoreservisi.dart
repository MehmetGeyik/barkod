import 'package:barkod/modeller/kullanici.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServisi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DateTime zaman = DateTime.now(); 

  Future<void> kullaniciOlustur({id, email, kullaniciAdi, fotoUrl=""}) async {
    await _firestore.collection("kullanicilar").doc(id).set({
      "kullaniciAdi": kullaniciAdi,
      "email": email,
      "fotoUrl": fotoUrl,
      "hakkinda": "",
      "olusturulmaZamani": zaman
    });
  }

  Future<Kullanici> kullaniciGetir(id) async {
    DocumentSnapshot doc = await _firestore.collection("kullanicilar").doc(id).get();
    if(doc.exists){
      Kullanici kullanici = Kullanici.dokumandanUret(doc);
      return kullanici;
    }
    return null;
  }

  void kullaniciGuncelle({String kullaniciId, String kullaniciAdi, String fotoUrl = "", String hakkinda}){
    _firestore.collection("kullanicilar").doc(kullaniciId).update({
      "kullaniciAdi": kullaniciAdi,
      "hakkinda": hakkinda,
      "fotoUrl": fotoUrl
    });
  }
}