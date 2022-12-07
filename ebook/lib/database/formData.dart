import 'package:flutter/material.dart';
import 'package:myflutterapp/database/db_helper.dart';
import 'package:myflutterapp/database/data.dart';

class FormData extends StatefulWidget{
  final Data? data;

  FormData({this.data});

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData>{
  DbHelper db = DbHelper();

  TextEditingController? judul;
  TextEditingController? cover;
  TextEditingController? tahun;
  TextEditingController? kategori;
  TextEditingController? deskripsi;
  TextEditingController? isi;
  TextEditingController? rating;

  @override
  void initState(){
    judul = TextEditingController(
      text: widget.data == null ? '' : widget.data!.judul
    );

    cover = TextEditingController(
      text: widget.data == null ? '' : widget.data!.cover
    );

    tahun = TextEditingController(
        text: widget.data == null ? '' : widget.data!.tahun
    );

    kategori = TextEditingController(
        text: widget.data == null ? '' : widget.data!.kategori
    );

    deskripsi = TextEditingController(
        text: widget.data == null ? '' : widget.data!.deskripsi
    );

    isi = TextEditingController(
        text: widget.data == null ? '' : widget.data!.isi
    );

    rating = TextEditingController(
        text: widget.data == null ? '' : widget.data!.rating
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: 20
              ),
            child: TextField(
              controller: judul,
              decoration: InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 20
            ),
            child: TextField(
              controller: cover,
              decoration: InputDecoration(
                  labelText: 'cover',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 20
            ),
            child: TextField(
              controller: tahun,
              decoration: InputDecoration(
                  labelText: 'tahun',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 20
            ),
            child: TextField(
              controller: kategori,
              decoration: InputDecoration(
                  labelText: 'kategori',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 20
            ),
            child: TextField(
              controller: deskripsi,
              decoration: InputDecoration(
                  labelText: 'deskripsi',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 20
            ),
            child: TextField(
              controller: isi,
              decoration: InputDecoration(
                  labelText: 'isi',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 20
            ),
            child: TextField(
              controller: rating,
              decoration: InputDecoration(
                  labelText: 'rating',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
          ),

          Padding(
              padding: EdgeInsets.only(
                top: 20
              ),
            child: ElevatedButton(
              child: (widget.data == null)
              ? Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ) :
                  Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
              onPressed: (){
                upsertData();
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> upsertData() async {
    if(widget.data != null){
      //update
      await db.updateData(Data(
        id: widget.data!.id,
        judul: judul!.text,
        cover: cover!.text,
        tahun: tahun!.text,
        kategori: kategori!.text,
        deskripsi: deskripsi!.text,
        isi: isi!.text,
        rating: rating!.text,
      ));

      Navigator.pop(context, 'update');
    }
    else{
      //insert
      await db.saveData(Data(
        judul: judul!.text,
        cover: cover!.text,
        tahun: tahun!.text,
        kategori: kategori!.text,
        deskripsi: deskripsi!.text,
        isi: isi!.text,
        rating: rating!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}