import 'package:flutter/material.dart';
import 'package:myflutterapp/nyobaApi/models/DataService.dart';
import 'package:myflutterapp/nyobaApi/models/dataDummy.dart';
import 'package:myflutterapp/nyobaApi/models/tambahUser.dart';

class Tampil extends StatefulWidget{
  @override
  _TampilState createState() => _TampilState();
}

class _TampilState extends State<Tampil>{
  late Future data;
  List<DataDummy> data2 = [];

  @override
  void initState(){
    data = DataService().getData();
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
        title: Text("List User",
          style: TextStyle(color: Colors.black,
              fontSize: 26),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: data2.length == 0 ? Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ) : ListView.builder(
          itemCount: data2.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(data2[index].username),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TambahUser()));
        },
      ),
    );
  }
}