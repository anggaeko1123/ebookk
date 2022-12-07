import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/nyobaApi/detail.dart';
import 'package:myflutterapp/nyobaApi/item.dart';
import 'package:myflutterapp/nyobaApi/model.dart';
import 'package:myflutterapp/nyobaApi/apiServices.dart';
import 'package:myflutterapp/remote/crud/tambah.dart';

class Halaman extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Wisata'),
      ),
      body: GridWisata(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => TambahWisata()));
        },
      ),
    );
  }
}

class GridWisata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<Datum>>(
          future: ApiService.getWisata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              List<Datum>? listWisata = snapshot.data;
              return ListView.builder(
                itemCount: listWisata?.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Detail(data: snapshot.data![index]);
                      }));
                    },
                    child: itemWisata(listWisata![index]),
                  );
                },
              );
            }
          },
        )
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:myflutterapp/remote/apiModel.dart';
// import 'package:myflutterapp/remote/apiServices.dart';
//
// class Nyoba extends StatefulWidget{
//   Nyoba({Key? key}) : super(key: key);
//
//   @override
//   _Nyoba createState() => _Nyoba();
// }
//
// class _Nyoba extends State<Nyoba>{
//
//   List<ApiModel> listApiModel = [];
//   ApiService apiService = ApiService();
//
//   getData() async {
//     listApiModel = await ApiService.getData();
//   }
//
//   @override
//   void initState(){
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Api"),
//       ),
//       body: ListView.builder(
//         itemCount: listApiModel.length,
//           itemBuilder: (BuildContext context, int index) {
//           return buildListItem(index);
//           }
//       ),
//     );
//   }
//
//   Widget buildListItem(index){
//     var item = listApiModel[index];
//     return Card(
//       child: ListTile(
//         title: Text(
//           item.username.toString(),
//           style: TextStyle(fontSize: 18),
//         ),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 20,
//               backgroundColor: Colors.grey,
//               child: IconButton(
//                 color: Colors.white,
//                 onPressed: (){},
//                 icon: Icon(Icons.edit),
//               ),
//             ),
//             SizedBox(width: 5),
//             CircleAvatar(
//               radius: 20,
//               backgroundColor: Colors.red,
//               child: IconButton(
//                 color: Colors.white,
//                 onPressed: (){},
//                 icon: Icon(Icons.delete),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:myflutterapp/remote/apiModel.dart';
// import 'package:myflutterapp/remote/apiServices.dart';
//
// class Nyoba extends StatefulWidget{
//   Nyoba({Key? key, required this.items}) : super(key: key);
//
//   final String items;
//
//   @override
//   _Nyoba createState() => _Nyoba();
// }
//
// class _Nyoba extends State<Nyoba>{
//   List<ApiModel> listApiModel = [];
//   ApiService apiService = ApiService();
//
//   getData() async {
//     listApiModel = await apiService.getData();
//   }
//
//   @override
//   void intiState(){
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.items),
//       ),
//       body: ListView.separated(
//           itemBuilder: (context, index){
//             return Container(
//               child: Text(listApiModel[index].username),
//             );
//           },
//           separatorBuilder: (context, index){
//             return Divider();
//           },
//           itemCount: listApiModel.length
//       ),
//     );
//   }
// }







// void main() {
//   runApp(MaterialApp(
//     home: BelajarGetData(),
//   ));
// }
//
// class BelajarGetData extends StatelessWidget {
//   final String apiUrl = "https://633fdc42e44b83bc73c2d9be.mockapi.io/api/api";
//
//   Future<List<dynamic>> _fecthDataUsers() async {
//     var result = await http.get(Uri.parse(apiUrl));
//     return json.decode(result.body)['data'];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Belajar GET HTTP'),
//       ),
//       body: Container(
//         child: FutureBuilder<List<dynamic>>(
//           future: _fecthDataUsers(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   padding: EdgeInsets.all(10),
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       leading: CircleAvatar(
//                         radius: 30,
//                       ),
//                       title: Text(snapshot.data[index]['username']),
//                       subtitle: Text(snapshot.data[index]['email']),
//                     );
//                   });
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:myflutterapp/remote/apiModel.dart';
// import 'package:myflutterapp/remote/apiServices.dart';
//
// class HomeScreen extends StatefulWidget{
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen>{
//   late ApiService api;
//
//   @override
//   void initState(){
//     super.initState();
//     api = ApiService();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: FutureBuilder(
//         future: api.getApi(),
//         builder: (BuildContext context, AsyncSnapshot<List<ApiModel>>
//             snapshot){
//           if(snapshot.hasError){
//             return Center(
//               child: Text(
//                 "Something wrong with message: ${snapshot.error.toString()}"
//               ),
//             );
//           }
//           else if(snapshot.connectionState == ConnectionState.done){
//             List<ApiModel>? apimodels = snapshot.data;
//             return _buildListView(apimodels);
//           }
//           else{
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Widget _buildListView(List<ApiModel> apimodels){
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           vertical: 8,
//         horizontal: 16
//       ),
//       child: ListView.builder(
//           itemBuilder: (context, index){
//             ApiModel apimodel = apimodels[index];
//           }
//       ),
//     );
//   }
// }