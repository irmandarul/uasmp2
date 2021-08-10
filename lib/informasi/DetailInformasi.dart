import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(int id) async {
  final response = await http.get(Uri.parse(
      'https://masjid-al-ikhlas.com/irman/flutter/detail_informasi.php/$id'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

class Album {
  final int id;
  final String judul;
  final String deskripsi;

  Album({
    this.id,
    this.judul,
    this.deskripsi,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
    );
  }
}

class DetailInformasi extends StatefulWidget {
  final int id;
  // constructor
  DetailInformasi({@required this.id, Key key}) : super(key: key);

  @override
  _DetailInformasiState createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(snapshot.data.judul),
                  ),
                  ListTile(
                    leading: Icon(Icons.bookmark_add_outlined),
                    title: Text(snapshot.data.deskripsi),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
