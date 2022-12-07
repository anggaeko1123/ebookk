import 'package:flutter/material.dart';
import 'package:myflutterapp/home/user/data/dataEbook.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:myflutterapp/home/user/data/dummyData.dart';

void main(){
  runApp(MaterialApp(
    title: 'Pdf dari asset',
    home: PdfAsset(),
  ));
}

class PdfAsset extends StatefulWidget{
  @override
  _PdfAssetPage createState() => _PdfAssetPage();
}

class _PdfAssetPage extends State<PdfAsset>{
  
  final GlobalKey<SfPdfViewerState> _pdfView = GlobalKey();
  // late final DataModel data;

  late final EbookData ebooks;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Pdf dari asset"),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                _pdfView.currentState?.openBookmarkView();
              },
              icon: Icon(
                  Icons.bookmark,
                color: Colors.black,
                semanticLabel: 'Bookmark',
              )
          )
        ],
      ),
      // body: SfPdfViewer.asset(data.isi.toString()),
      body: SfPdfViewer.asset(ebooks.isi),
      // body: SfPdfViewer.asset('assets/pdf/Jejak-Islam-dalam-Manuskrip-di-Bali_CEKLIST.pdf'),
      key: _pdfView,
    );
  }
}