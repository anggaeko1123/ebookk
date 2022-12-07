//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myflutterapp/home/user/data/dataEbook.dart';
// import 'package:myflutterapp/home/user/detailEbook.dart';
//
//
// Widget myEbook(EbookData ebook) {
//   return Container(
//     width: 122,
//     margin: EdgeInsets.only(right: 12),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           child: InkWell(
//             onTap: (){
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EbookDetail(ebook: ebook))
//               );
//             },
//           ),
//           width: 121.66,
//           height: 180.5,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               image: DecorationImage(
//                   image: NetworkImage(ebook.cover),
//                   fit: BoxFit.cover)),
//         ),
//         SizedBox(
//           height: 12,
//         ),
//         Text(
//           ebook.judul,
//           style: TextStyle(fontSize: 14),
//         )
//       ],
//     ),
//   );
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // class MyEbooks extends StatefulWidget {
// //   MyEbooks(DataModel data);
// //
// //   @override
// //   _MyEbooksPageState createState() => _MyEbooksPageState();
// // }
// //
// // class _MyEbooksPageState extends State<MyEbooks> {
// //   @override
// //   Widget build(BuildContext context){
// //     return Scaffold(
// //       body: FutureBuilder(
// //         future: ReadJsonData(),
// //         builder: (context, data){
// //           if (data.hasError) {
// //           return Center(child: Text("${data.error}"));
// //           }
// //           else if (data.hasData) {
// //             var items = data.data as List<DataModel>;
// //             return Scaffold(
// //               body: GridView.builder(
// //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 2,
// //                   ),
// //                   itemCount: items.length,
// //                   itemBuilder: (BuildContext context, int index){
// //                     return Container(
// //                       width: 122,
// //                       margin: EdgeInsets.only(right: 12),
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Container(
// //                             width: 121.66,
// //                             height: 180.5,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(8),
// //                               image: DecorationImage(
// //                                 image: NetworkImage(items[index].cover.toString()),
// //                                 fit: BoxFit.cover
// //                               )
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             height: 12,
// //                           ),
// //                           Text(
// //                               items[index].judul.toString(),
// //                             style: TextStyle(fontSize: 18),
// //                           )
// //                         ],
// //                       ),
// //                     );
// //                   }
// //               ),
// //             );
// //           }
// //           else {
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// //
// //   Future<List<DataModel>> ReadJsonData() async {
// //     final jsondata =
// //     await rootBundle.rootBundle.loadString('assets/hibernasi.json');
// //     final list = json.decode(jsondata) as List<dynamic>;
// //     return list.map((e) => DataModel.fromJson(e)).toList();
// //   }
// // }
