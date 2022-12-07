import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
import 'package:myflutterapp/remote/nyoba.dart';


class TambahWisata extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _hariController = TextEditingController();
  TextEditingController _jamController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  Future simpanWisata() async {
    final response = await http.post(Uri.parse("https://625a05cb43fda1299a14aa37.mockapi.io/api/v1/tourism-places"),body: {
      "name": _namaController.text,
      "location": _lokasiController.text,
      "open": _hariController.text,
      "hours": _jamController.text,
      "ticket": _hargaController.text,
      "description": _deskripsiController.text,
      "main-image": _imageController.text,
    });

    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Wisata"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: "Nama Wisata"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Nama Wisata";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lokasiController,
              decoration: InputDecoration(labelText: "Lokasi Wisata"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Lokasi Wisata";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _hariController,
              decoration: InputDecoration(labelText: "Hari Buka"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Hari Buka Wisata";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _jamController,
              decoration: InputDecoration(labelText: "Jam Buka"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Jam Buka Wisata";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _hargaController,
              decoration: InputDecoration(labelText: "Harga Tiket"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Harga Tiket";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: "Deskripsi Wisata"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Deskripsi Wisata";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(labelText: "Gambar Wisata"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Gambar Wisata";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              if(_formKey.currentState!.validate()){
                simpanWisata().then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Halaman()));
                });
              }
            }, child: Text("Simpan"))
          ],
        ),
      ),
    );
  }
}