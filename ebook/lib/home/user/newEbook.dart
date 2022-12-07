// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myflutterapp/home/user/data/dataEbook.dart';
// import 'package:myflutterapp/home/user/data/dummyData.dart';
// import 'package:myflutterapp/home/user/data/ebook_provider.dart';
//
// class NewEbook extends StatefulWidget{
//   NewEbook({Key? key, this.wishlist = false}) : super(key: key);
//
//   final bool wishlist;
//
//   @override
//   _NewEbookState createState() => _NewEbookState();
// }
//
// class _NewEbookState extends State<NewEbook>{
//
//   @override
//   Widget build(BuildContext context){
//     List<EbookData> ebooks = [];
//     // var ebooks = context.baca<EbookProvider>().ebooks;
//     // var myList = context.baca<EbookProvider>().myList;
//
//     return Scaffold(
//       body: GridView.builder(
//           padding: EdgeInsets.symmetric(
//             horizontal: 8,
//             vertical: 16
//           ),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 1,
//             childAspectRatio: 2.4
//           ),
//           itemCount: ebooks.length,
//           itemBuilder: (BuildContext context, int index){
//             return Container(
//               width: double.infinity,
//               height: 150,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     ///beralih ke halaman detail
//                     child: InkWell(
//                       onTap: (){
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(builder: (context) => EbookDetail(ebook: ebook))
//                         // );
//                       },
//                     ),
//                     margin: EdgeInsets.only(right: 8),
//                     height: 125,
//                     width: 83,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         image: DecorationImage(image: NetworkImage(ebooks[index].cover),
//                             fit: BoxFit.cover
//                         )
//                     ),
//                   ),
//                   Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             ebooks[index].judul,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold
//                             ),
//                           ),
//                           Text(
//                             'rating : ' + ebooks[index].rating,
//                             style: TextStyle(
//                                 fontSize: 18
//                             ),
//                           ),
//                           SizedBox(
//                             height: 12,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Icon(Icons.content_copy),
//                               Text(ebooks[index].halaman),
//                               SizedBox(width: 20,),
//                               Icon(Icons.star_sharp)
//                             ],
//                           )
//                         ],
//                       )
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(0),
//                         child: IconButton(
//                           padding: EdgeInsets.all(0),
//                           alignment: Alignment.centerRight,
//                           icon: (_isFavorite
//                               ? const Icon(Icons.bookmark)
//                               : const Icon(Icons.bookmark_border)
//                           ),
//                           color: Colors.black,
//                           onPressed: _toggleFavorite,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 18,
//                         child: SizedBox(
//                           child: Text('$_favoriteCount'),
//                         ),
//                       )
//                     ],
//                   ),
//                   // Icon(Icons.bookmark_border),
//                 ],
//               ),
//             );
//           }
//       )
//     );
//   }
// }