import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/nyobaApi/model.dart';
import 'package:myflutterapp/remote/nyoba.dart';


class Detail extends StatelessWidget {
  const Detail({Key? key, required this.data}) : super(key: key);

  final Datum data;

  Future hapusWisata(String wisataId) async {
    String _url = "https://625a05cb43fda1299a14aa37.mockapi.io/api/v1/tourism-places/" + wisataId;
    var response = await http.delete(Uri.parse(_url));

    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Wisata'),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                hapusWisata(data.id.toString()).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Halaman()));
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Wisata berhasil dihapus"),
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
            Image.network(data.mainImage),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                data.name,
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
                      Text(data.open),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.alarm_sharp),
                      Text(data.hours),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.paid_outlined),
                      Text(data.ticket),
                    ],
                  ),
                ],
              ),
            ),//Container for Icons
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Jelly-Anika',
                ),
              ),
            ),//Container for Description
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(data.mainImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(data.mainImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(data.mainImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(data.mainImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                  ),
                ],
              ),
            ),//Container for Photos
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () async {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => EditWisata(data: data)));
        },
      ),
    );
  }
}