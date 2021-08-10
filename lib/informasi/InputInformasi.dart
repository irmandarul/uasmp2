// ignore_for_file: deprecated_member_use, missing_return

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/informasi/ViewInformasi.dart';

class InputInformasi extends StatefulWidget {
  @override
  _InputInformasiState createState() => _InputInformasiState();
}

class _InputInformasiState extends State<InputInformasi> {
  String judul, deskripsi;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final response = await http.post(
        "https://masjid-al-ikhlas.com/irman/flutter/input_informasi.php",
        body: {
          "judul": judul,
          "deskripsi": deskripsi,
        });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ViewInformasi()));
      });
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "FORM INPUT INFORMASI",
                style: TextStyle(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              style: TextStyle(color: Colors.black, fontSize: 20),
              validator: (e) {
                if (e.isEmpty) {
                  return "Masukan Judul";
                }
              },
              onSaved: (e) => judul = e,
              decoration: InputDecoration(labelText: "Judul"),
            ),
            TextFormField(
              style: TextStyle(color: Colors.black, fontSize: 20),
              validator: (e) {
                if (e.isEmpty) {
                  return "Masukan Deskripsi";
                }
              },
              onSaved: (e) => deskripsi = e,
              decoration: InputDecoration(labelText: "Deskripsi"),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: RaisedButton(
                onPressed: () {
                  check();
                },
                child: Text(
                  "Simpan",
                  style: TextStyle(fontSize: 20),
                ),
                colorBrightness: Brightness.dark,
                color: Colors.blue[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
