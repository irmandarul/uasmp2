import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.book),
              title: Text('SEKOLAH TINGGI TEKNOLOGI BANDUNG'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add_outlined),
              title: Text('IRMAN DARUL MUTAQIN'),
              subtitle: Text('Nama Lengkap'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add_outlined),
              title: Text('18111411'),
              subtitle: Text('NPM'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add_outlined),
              title: Text('TIF RM 18 CIDC'),
              subtitle: Text('Kelas'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add_outlined),
              title: Text('TEKNIK INFORMATIKA'),
              subtitle: Text('Jurusan'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add_outlined),
              title: Text('PEMOGRAMAN MOBILE 2'),
              subtitle: Text('Matakuliah'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add_outlined),
              title: Text('Arief Hertadi Rustam, S.T,M.Kom.'),
              subtitle: Text('Dosen'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
