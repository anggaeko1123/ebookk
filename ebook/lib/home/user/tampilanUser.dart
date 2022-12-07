import 'package:flutter/material.dart';
import 'package:myflutterapp/admin/service/apiServices.dart';
import 'package:myflutterapp/admin/service/apiModelEbook.dart';
import 'package:myflutterapp/detail/detailApi/detail_api.dart';

class TampilanUser extends StatefulWidget{
  TampilanUser({Key? key}) : super(key: key);

  @override
  State<TampilanUser> createState() => _TampilanUserPageState();
}

class _TampilanUserPageState extends State<TampilanUser> {
  List<DataDummy> listdatamodel = [];
  ApiService apiKey = ApiService();


  getData() async{
    listdatamodel = await apiKey.getData();
    setState((){});
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: listdatamodel.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            width: 60,
            margin: EdgeInsets.zero,
            child: Card(
              ///menambah bayangan
              elevation: 5,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Material(
                      child: InkWell(
                        // onTap: () => Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => DetailView(data: items[index])
                        //     )
                        // ),
                        child: Image(image: NetworkImage(
                            listdatamodel[index].cover.toString()),
                          fit: BoxFit.cover,
                          height: 160,
                        ),
                        highlightColor: Colors.tealAccent,
                      ),
                    ),
                  ),

                  GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Text(listdatamodel[index].judul.toString()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}