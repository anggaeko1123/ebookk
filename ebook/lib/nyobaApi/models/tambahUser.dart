import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myflutterapp/nyobaApi/models/tampilan.dart';
import 'package:http/http.dart'as http;
import 'package:myflutterapp/nyobaApi/models/DataService.dart';

class TambahUser extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future simpanWisata() async {
    final response = await http.post(Uri.parse("https://633fdc42e44b83bc73c2d9be.mockapi.io/api/api"),body: {
      "email": _emailController.text,
      "username": _usernameController.text,
      "password": _passwordController.text,
    });

    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah User"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Nama Wisata"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Nama Wisata";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Lokasi Wisata"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Lokasi Wisata";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Hari Buka"),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Masukkan Hari Buka Wisata";
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