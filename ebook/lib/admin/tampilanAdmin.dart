import 'package:flutter/material.dart';
import 'package:myflutterapp/admin/crud/inputData.dart';
import 'package:myflutterapp/admin/service/apiServices.dart';
import 'package:myflutterapp/admin/service/apiModelEbook.dart';
import 'package:myflutterapp/detail/detailApi/detail_api.dart';

class Tampil extends StatefulWidget{
  @override
  _TampilState createState() => _TampilState();
}

class _TampilState extends State<Tampil>{
  late Future data;
  List<DataDummy> data2 = [];

  @override
  void initState(){
    data = ApiService().getData();
    data.then((value){
      setState(() {
        data2 = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("List Ebook",
          style: TextStyle(color: Colors.black,
              fontSize: 26),),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: data2.length == 0 ? Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ) : ListView.builder(
          itemCount: data2.length,
          itemBuilder: (context, index){
            return InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Expanded(
                    flex: 1,
                    child: Image.network(data2[index].cover),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            data2[index].judul,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(data2[index].tahun),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailApi(data: data2[index]);
                }));
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TambahData()));
        },
      ),
    );
  }
}