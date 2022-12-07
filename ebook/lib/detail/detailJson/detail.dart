import 'package:flutter/material.dart';
import 'package:myflutterapp/detail/detailJson/isi.dart';
import 'package:myflutterapp/home/bottomNavBar.dart';
import 'package:myflutterapp/model/jsonModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutterapp/pdfModel/pdfView.dart';
import 'package:myflutterapp/pdfModel/pdfViewAsset.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.data}) : super(key: key);

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              data.cover.toString(),
              height: 300,
              width: 70,
              fit: BoxFit.cover,
            ),
            Padding(padding: EdgeInsets.all(10)),

            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                "${data.judul}",
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                    fontSize: 30,
                    color: Colors.teal.shade700
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 92,
                    width: 120,
                    color: Colors.lightGreen.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.category_rounded, color: Colors.green,),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                            data.kategoribuku.toString()
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: 92,
                    width: 120,
                    color: Colors.lightBlue.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.date_range, color: Colors.blue,),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                            "${data.tahun_terbit}"
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: 92,
                    width: 120,
                    color: Colors.yellow.shade400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star_sharp, color: Colors.yellowAccent,),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                            data.rating.toString()
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                data.deskripsi.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                ),
              ),
            ),

            TextButton(
              style:
              TextButton.styleFrom(backgroundColor: Colors.yellowAccent),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Isi(data: data,)));
              },
              child: Text(
                "Read More",
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ),

            TextButton(
              style:
              TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pdf()));
              },
              child: Text(
                "from url",
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ),

            TextButton(
              style:
              TextButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PdfAsset()));
              },
              child: Text(
                "from asset",
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}