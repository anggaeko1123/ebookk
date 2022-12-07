// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myflutterapp/home/user/data/dataEbook.dart';
// import 'package:myflutterapp/home/user/data/ebook_provider.dart';
//
// class FavoriteButton extends StatefulWidget{
//   @override
//   _FavoriteButtonState createState() => _FavoriteButtonState();
// }
//
// class _FavoriteButtonState extends State<FavoriteButton> {
//   bool isFavorite = false;
//
//   List<EbookData> get ebooks => ebooks;
//   List<EbookData> _myList = [];
//
//   @override
//   Widget build(BuildContext context){
//     return IconButton(
//         icon: Icon(
//             isFavorite
//                 ? Icons.favorite
//                 : Icons.favorite_border,
//           color: Colors.red,
//         ),
//       onPressed: (){
//           setState(() {
//             if(isFavorite == true){
//               _myList.remove(ebooks);
//             }
//             else{
//               _myList.add(ebooks);
//             }
//             // isFavorite = !isFavorite;
//           });
//       },
//     );
//   }
// }