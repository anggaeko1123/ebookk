import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:myflutterapp/detail/detailJson/detail.dart';
import 'package:myflutterapp/home/bottomNavBar.dart';
import 'package:myflutterapp/model/jsonModel.dart';


class Memorabilia extends StatefulWidget {
  @override
  _MemorabiliaPageState createState() => _MemorabiliaPageState();
}

class _MemorabiliaPageState extends State<Memorabilia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            }
            else if (data.hasData) {
              var items = data.data as List<DataModel>;
              return Scaffold(
                body: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 100,
                        margin: EdgeInsets.zero,
                        child: Card(
                          elevation: 5,

                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Material(
                                  child: InkWell(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => DetailView(data: items[index])
                                        )
                                    ),
                                    child: Image(image: NetworkImage(
                                        items[index].cover.toString()),
                                      fit: BoxFit.cover,
                                      height: 160,
                                    ),
                                  ),
                                ),
                              ),
                              GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text(items[index].judul.toString()),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),

                // bottomNavigationBar: BottomNavBar(),

              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<List<DataModel>> ReadJsonData() async {
    final jsondata =
    await rootBundle.rootBundle.loadString('assets/memorabilia.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => DataModel.fromJson(e)).toList();
  }
}