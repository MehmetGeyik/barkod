import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
        children: <Widget>[
          FlutterLogo(size: 90.0,),
          SizedBox(height: 80.0,),
          TextFormField(
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail adresinizi girin",
              prefixIcon: Icon(Icons.mail),
            ),
          ),
          SizedBox(height:40.0,),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Şifrenizi girin",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height:40.0,),
          Row(children: <Widget>[
            Expanded(
                          child: FlatButton(
                onPressed: (){},
                child: Text(
                  "Hesap Oluştur",
                  style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.white 
                  )
                  ),
                  color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                          child: FlatButton(
                onPressed: (){},
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.white 
                  )
                  ),
                  color: Theme.of(context).primaryColorDark,
              ),
            )
          ],)
        ],
      ),
     // backgroundColor: Colors.blue[700],
    );
  }
}