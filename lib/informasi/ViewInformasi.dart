import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/informasi/DetailInformasi.dart';
import 'package:project/informasi/InputInformasi.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://masjid-al-ikhlas.com/irman/flutter/list_informasi.php'));

  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int id;
  final String judul;
  final String deskripsi;

  Photo({
    this.id,
    this.judul,
    this.deskripsi,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        id: json['id'], judul: json['judul'], deskripsi: json['deskripsi']);
  }
}

class ViewInformasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Infromasi(),
    );
  }
}

class _Infromasi extends StatelessWidget {
  final String title;

  _Infromasi({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? _ViewInformasi(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InputInformasi()));
          }),
    );
  }
}

class _ViewInformasi extends StatelessWidget {
  final List<Photo> photos;

  _ViewInformasi({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int i) =>
            Divider(color: Colors.grey[400]),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DetailInformasi(
                          id: photos[index].id,
                          key: ValueKey(photos[index].id))));
            },
            leading: Icon(
              Icons.info_sharp,
              color: Colors.green,
              size: 30,
            ),
            title: Text(photos[index].judul,
                style: TextStyle(color: Colors.red, fontSize: 17)),
            subtitle: Text(photos[index].deskripsi,
                style: TextStyle(color: Colors.black, fontSize: 14)),
          );
        },
      ),
    );
  }
}
