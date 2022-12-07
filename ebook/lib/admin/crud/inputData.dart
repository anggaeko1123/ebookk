import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:myflutterapp/admin/tampilanAdmin.dart';

class TambahData extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _judulController = TextEditingController();
  TextEditingController _coverController = TextEditingController();
  TextEditingController _tahunController = TextEditingController();
  TextEditingController _kategoriController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _isiController = TextEditingController();
  TextEditingController _ratingController = TextEditingController();
  Future simpanData() async {
    final response = await http.post(Uri.parse("https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data"),body: {
      "judul": _judulController.text,
      "cover": _coverController.text,
      "tahun": _tahunController.text,
      "kategori": _kategoriController.text,
      "deskripsi": _deskripsiController.text,
      "isi": _isiController.text,
      "rating": _ratingController.text,
    });

    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah data"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _judulController,
              decoration: InputDecoration(labelText: "Judul"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Judul";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _coverController,
              decoration: InputDecoration(labelText: "Cover/Image"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Cover";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tahunController,
              decoration: InputDecoration(labelText: "Tahun Terbit"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Tahun Terbit";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _kategoriController,
              decoration: InputDecoration(labelText: "Kategori"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Kategori";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: "Deskripsi"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan deskripsi";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _isiController,
              decoration: InputDecoration(labelText: "Isi"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Isi";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: "Rating"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Rating";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              if(_formKey.currentState!.validate()){
                simpanData().then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Tampil()));
                });
              }
            }, child: Text("Simpan"))
          ],
        ),
      ),
    );
  }
}