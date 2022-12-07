import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myflutterapp/admin/tampilanAdmin.dart';
import 'package:http/http.dart'as http;
import 'package:myflutterapp/admin/service/apiServices.dart';
import 'package:myflutterapp/admin/service/apiModelEbook.dart';

class EditData extends StatelessWidget {

  final DataDummy data ;
  EditData({required this.data});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _judulController = TextEditingController();
  TextEditingController _coverController = TextEditingController();
  TextEditingController _tahunController = TextEditingController();
  TextEditingController _kategoriController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _isiController = TextEditingController();
  TextEditingController _ratingController = TextEditingController();
  Future editWisata() async {
    final response = await http.put(Uri.parse("https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data" + data.id),body: {
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
        title: Text("Tambah Data Ebook"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _judulController..text = data.judul,
              decoration: InputDecoration(labelText: "Judul Ebook"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Judul Ebook";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _coverController..text = data.cover,
              decoration: InputDecoration(labelText: "Cover/Image"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Link Gambar";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tahunController..text = data.tahun,
              decoration: InputDecoration(labelText: "Tahun Terbit"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Tahun Terbit";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _kategoriController..text = data.kategori,
              decoration: InputDecoration(labelText: "Kategori"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Kategori";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _deskripsiController..text = data.deskripsi,
              decoration: InputDecoration(labelText: "Deskripsi"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Deskripsi";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _isiController..text = data.isi,
              decoration: InputDecoration(labelText: "Isi EBook"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Isi Ebook";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ratingController..text = data.rating,
              decoration: InputDecoration(labelText: "Rating Ebook"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Rating Ebook";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              if(_formKey.currentState!.validate()){
                editWisata().then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Tampil()));
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Ebook berhasil diubah"),
                      ));
                });
              }
            }, child: Text("Simpan"))
          ],
        ),
      ),
    );
  }
}