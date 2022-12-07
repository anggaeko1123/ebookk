import 'dart:convert';
import 'package:myflutterapp/admin/service/apiModelEbook.dart';
import 'package:myflutterapp/admin/tampilanAdmin.dart';
import 'package:myflutterapp/admin/crud/editData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DetailApi extends StatelessWidget {
  const DetailApi({Key? key, required this.data}) : super(key: key);

  final DataDummy data;

  Future hapusData(String idEbook) async {
    String _url = "https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data/" + idEbook;
    var response = await http.delete(Uri.parse(_url));

    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Ebook'),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                hapusData(data.id.toString()).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Tampil()));
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Ebook berhasil dihapus"),
                      ));
                });
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(data.cover),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                data.judul,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Gendis-Script',
                ),
              ),
            ),//Container for Title
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      Text(data.tahun),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.alarm_sharp),
                      Text(data.kategori),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.paid_outlined),
                      Text(data.rating),
                    ],
                  ),
                ],
              ),
            ),//Container for Icons
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                data.deskripsi,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Jelly-Anika',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditData(data: data)));
        },
      ),
    );
  }
}