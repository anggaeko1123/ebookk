import 'package:flutter/material.dart';
import 'package:myflutterapp/home/user/data/dataEbook.dart';
import 'package:myflutterapp/home/user/data/dummyData.dart';
import 'package:myflutterapp/home/user/detailEbook.dart';

class ListItem extends StatelessWidget{
  final EbookData ebook;
  final bool isDone;
  final Function(bool? value) onCheckboxClick;

  ListItem({
    required this.ebook,
    required this.isDone,
    required this.onCheckboxClick
});

  @override
  Widget build(BuildContext context){
    // return Column(
    //   children: [
    //     SingleChildScrollView(
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             TextField(
    //               decoration: InputDecoration(
    //                   filled: true,
    //                   fillColor: Colors.white,
    //                   prefixIcon: Icon(Icons.search),
    //                   hintText: 'search your favorite ebook...',
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(8),
    //                       borderSide: BorderSide.none)
    //               ),
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Text(
    //               'My Ebooks',
    //               style: TextStyle(fontSize: 20),
    //             ),
    //             SizedBox(
    //               height: 12,
    //             ),
    //             Container(
    //               height: 200,
    //               child: PageView(
    //                 /// boucingscrollphysics() membuat efek mantul saat discroll ke samping
    //                 physics: BouncingScrollPhysics(),
    //                 controller: _pageContoller,
    //
    //                 /// membuat pageview dapat di scroll ke samping
    //                 scrollDirection: Axis.horizontal,
    //                 children: [
    //                   Container(
    //                     margin: EdgeInsets.only(right: 15),
    //                     width: 350,
    //                     height: 200,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(15),
    //                       image: DecorationImage(
    //                         fit: BoxFit.cover,
    //                         image: NetworkImage(
    //                           "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //
    //                   Container(
    //                     margin: EdgeInsets.only(right: 15),
    //                     width: 350,
    //                     height: 200,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(15),
    //                       image: DecorationImage(
    //                         fit: BoxFit.cover,
    //                         image: NetworkImage(
    //                           "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //
    //                   Container(
    //                     margin: EdgeInsets.only(right: 15),
    //                     width: 350,
    //                     height: 200,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(15),
    //                       image: DecorationImage(
    //                         fit: BoxFit.cover,
    //                         image: NetworkImage(
    //                           "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //
    //     Text(
    //       'see also',
    //       style: TextStyle(fontSize: 20),
    //     ),
    //     SizedBox(
    //       height: 12,
    //     ),
    //
    //     Container(
    //       width: double.infinity,
    //       height: 150,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             margin: EdgeInsets.only(right: 8),
    //             height: 125,
    //             width: 83,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(8),
    //                 image: DecorationImage(
    //                     image: NetworkImage(ebook.cover),
    //                     fit: BoxFit.cover)),
    //           ),
    //           Expanded(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     ebook.judul,
    //                     style: TextStyle(
    //                         fontSize: 20, fontWeight: FontWeight.bold),
    //                   ),
    //                   Text(
    //                     'rating : ' + ebook.rating,
    //                     style: TextStyle(fontSize: 18),
    //                   ),
    //                   SizedBox(
    //                     height: 12,
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Icon(Icons.content_copy),
    //                       Text(ebook.halaman),
    //                       SizedBox(
    //                         width: 20,
    //                       ),
    //                       Icon(Icons.star_sharp)
    //                     ],
    //                   )
    //                 ],
    //               )),
    //           Checkbox(
    //               value: isDone,
    //               onChanged: onCheckboxClick
    //           )
    //         ],
    //       ),
    //     )
    //   ],
    // );





    return Container(
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            ///beralih ke halaman detail
            // child: InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => EbookDetail(
            //               ebook: ebooks[index],
            //             )));
            //   },
            //   child: Consumer<EbookProvider>(
            //     builder: (context, EbookProvider data, widget){
            //       return ListItem(
            //
            //       )
            //     },
            //   ),
            // ),
            margin: EdgeInsets.only(right: 8),
            height: 125,
            width: 83,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(ebook.cover),
                    fit: BoxFit.cover)),
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ebook.judul,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'rating : ' + ebook.rating,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.content_copy),
                      Text(ebook.halaman),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.star_sharp)
                    ],
                  )
                ],
              )
          ),
          Checkbox(
              value: isDone,
              onChanged: onCheckboxClick
          )
          // FavoriteButton()
        ],
      ),
    );
  }

  ///widget atas scroll ke samping
  // Widget myEbook(EbookData ebook) {
  //   return Container(
  //     width: 122,
  //     margin: EdgeInsets.only(right: 12),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           ///beralih ke halaman detail
  //           child: InkWell(
  //             onTap: () {
  //               // Navigator.push(
  //               //     context,
  //               //     MaterialPageRoute(
  //               //         builder: (context) => EbookDetail(ebook: ebook))
  //               // );
  //             },
  //           ),
  //           width: 121.66,
  //           height: 180.5,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               image: DecorationImage(
  //                   image: NetworkImage(ebook.cover), fit: BoxFit.cover)),
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
}

// class _pageContoller {
//   final _pageContoller = PageController(viewportFraction: 0.877);
//   double currentPage = 0;
//
//   @override
//   void initState(){
//     _pageContoller.addListener(() {
//       setState(() {
//         currentPage = _pageContoller.page!.toDouble();
//         print(currentPage);
//       });
//     });
//   }
// }