import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/home/FavoriteButton/favorite_button.dart';
import 'package:myflutterapp/home/user/SimpanData/list_item.dart';
import 'package:myflutterapp/home/user/SimpanData/pageSimpan.dart';
import 'package:myflutterapp/home/user/data/dataEbook.dart';
import 'package:myflutterapp/home/user/data/dummyData.dart';
import 'package:myflutterapp/home/user/data/ebook_provider.dart';
import 'package:myflutterapp/home/user/detailEbook.dart';
import 'package:myflutterapp/home/user/homeScreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool _isFavorite = false;
  // int _favoriteCount = 0;
  //
  // void _toggleFavorite() {
  //   setState(() {
  //     if (_isFavorite) {
  //       _favoriteCount -= 1;
  //       _isFavorite = false;
  //     } else {
  //       _favoriteCount += 1;
  //       _isFavorite = true;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Widget SearchField(){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'search your favorite book',
              // hintStyle: ,
              fillColor: Colors.grey,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                      Radius.circular(12)
                  )
              ),
              isCollapsed: true,
              contentPadding: EdgeInsets.all(18),
              suffixIcon: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                            Radius.circular(12)
                        )
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
              )
          ),
        ),
      );
    }

    Widget atas() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Container(
                width: 260,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2016/10/19/08/57/mountains-1752433__340.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2016/08/27/14/38/mountains-1624284__340.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      );
    }

    Widget bawah(){
      return ListView.builder(
        itemBuilder: (context, int index) {
          final EbookData ebook = ebooks[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EbookDetail(
                  ebook: ebooks[index],
                );
              }));
            },
            child: Consumer<EbookProvider>(
              builder: (context, EbookProvider data, widget) {
                return ListItem(
                    ebook: ebook,
                    isDone: data.myList.contains(ebook),
                    onCheckboxClick: (bool? value) {
                      setState(() {
                        if (value != null) {
                          value
                              ? data.myList.add(ebook)
                              : data.myList.remove(ebook);
                        }
                      });
                    });
              },
            ),
          );
        },
        itemCount: ebooks.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('ebook'),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return Wishlist();
                })
              );
            },
          )
        ],
      ),
      // body: ListView.builder(
      //     itemBuilder: (context, index){
      //       final EbookData ebook = ebooks[index];
      //       return Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           SearchField(),
      //           Padding(
      //               padding: EdgeInsets.symmetric(horizontal: 30),
      //               child: Text(
      //                 'Recent Book',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 16,
      //                     color: Colors.black
      //                 ),
      //               )
      //           ),
      //           atas(),
      //           SizedBox(
      //             height: 12,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Container(
      //                 ///beralih ke halaman detail
      //                 child: InkWell(
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => EbookDetail(
      //                               ebook: ebooks[index],
      //                             )));
      //                   },
      //                   // child: Consumer<EbookProvider>(
      //                   //   builder: (context, EbookProvider data, widget){
      //                   //     return ListItem(
      //                   //
      //                   //     )
      //                   //   },
      //                   // ),
      //                 ),
      //                 margin: EdgeInsets.only(right: 8),
      //                 height: 125,
      //                 width: 83,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(8),
      //                     image: DecorationImage(
      //                         image: NetworkImage(ebook.cover),
      //                         fit: BoxFit.cover)),
      //               ),
      //               Expanded(
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         ebook.judul,
      //                         style: TextStyle(
      //                             fontSize: 20, fontWeight: FontWeight.bold),
      //                       ),
      //                       Text(
      //                         'rating : ' + ebook.rating,
      //                         style: TextStyle(fontSize: 18),
      //                       ),
      //                       SizedBox(
      //                         height: 12,
      //                       ),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Icon(Icons.content_copy),
      //                           Text(ebook.halaman),
      //                           SizedBox(
      //                             width: 20,
      //                           ),
      //                           Icon(Icons.star_sharp)
      //                         ],
      //                       )
      //                     ],
      //                   )
      //               ),
      //               // FavoriteButton()
      //             ],
      //           )
      //         ],
      //       );
      //     }
      // ),

      // body: ListView(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.symmetric(vertical: 30),
      //       decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(30),
      //           )
      //       ),
      //       child: Column(
      //         children: [
      //           SearchField(),
      //           atas(),
      //
      //           // ListView.builder(
      //           //   itemBuilder: (context, int index) {
      //           //     final EbookData ebook = ebooks[index];
      //           //     return InkWell(
      //           //       onTap: () {
      //           //         Navigator.push(context, MaterialPageRoute(builder: (context) {
      //           //           return EbookDetail(
      //           //             ebook: ebooks[index],
      //           //           );
      //           //         }));
      //           //       },
      //           //       child: Expanded(
      //           //         child: Column(
      //           //           mainAxisAlignment: MainAxisAlignment.start,
      //           //           crossAxisAlignment: CrossAxisAlignment.start,
      //           //           children: [
      //           //             Container(
      //           //               margin: EdgeInsets.only(right: 8),
      //           //               height: 125,
      //           //               width: 83,
      //           //               decoration: BoxDecoration(
      //           //                 borderRadius: BorderRadius.circular(8),
      //           //                 image: DecorationImage(
      //           //                   image: NetworkImage(ebook.cover),
      //           //                   fit: BoxFit.cover
      //           //                 )
      //           //               ),
      //           //             ),
      //           //             Text(
      //           //               ebook.judul
      //           //             ),
      //           //             Text(
      //           //               ebook.rating
      //           //             )
      //           //           ],
      //           //         ),
      //           //       ),
      //           //     );
      //           //   },
      //           //   itemCount: ebooks.length,
      //           // )
      //         ],
      //       ),
      //     )
      //   ],
      // ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search your favorite ebook...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'My Ebooks',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    myEbook(ebooks[0]),
                    myEbook(ebooks[1]),
                    myEbook(ebooks[2]),
                    myEbook(ebooks[3]),
                  ],
                ),
              ),
              Text(
                'see also',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 12,
              ),

              Container(
                width: double.infinity,
                height: 600,
                child: ListView.builder(
                  itemCount: ebooks.length,
                  itemBuilder: (context, int index) {
                    final EbookData ebook = ebooks[index];
                    return Container(
                      width: double.infinity,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            ///beralih ke halaman detail
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EbookDetail(
                                              ebook: ebooks[index],
                                            )));
                              },
                            ),
                            margin: EdgeInsets.only(right: 8),
                            height: 125,
                            width: 83,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(ebooks[index].cover),
                                    fit: BoxFit.cover)),
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ebooks[index].judul,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'rating : ' + ebooks[index].rating,
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
                                  Text(ebooks[index].halaman),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.star_sharp)
                                ],
                              )
                            ],
                          )),
                          // FavoriteButton()
                        ],
                      ),
                    );


                  },
                ),
                  // child: ListView.builder(
                  //   itemBuilder: (context, int index) {
                  //     final EbookData ebook = ebooks[index];
                  //     return InkWell(
                  //       onTap: () {
                  //         Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //           return EbookDetail(
                  //             ebook: ebooks[index],
                  //           );
                  //         }));
                  //       },
                  //     );
                  //   },
                  //   itemCount: ebooks.length,
                  // )
                // child: ListView.builder(
                //   itemCount: ebooks.length,
                //   itemBuilder: (context, int index) {
                //     final EbookData ebook = ebooks[index];
                //     return Container(
                //       width: double.infinity,
                //       height: 150,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //             ///beralih ke halaman detail
                //             child: InkWell(
                //               onTap: () {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) => EbookDetail(
                //                               ebook: ebooks[index],
                //                             )));
                //               },
                //             ),
                //             margin: EdgeInsets.only(right: 8),
                //             height: 125,
                //             width: 83,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(8),
                //                 image: DecorationImage(
                //                     image: NetworkImage(ebooks[index].cover),
                //                     fit: BoxFit.cover)),
                //           ),
                //           Expanded(
                //               child: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 ebooks[index].judul,
                //                 style: TextStyle(
                //                     fontSize: 20, fontWeight: FontWeight.bold),
                //               ),
                //               Text(
                //                 'rating : ' + ebooks[index].rating,
                //                 style: TextStyle(fontSize: 18),
                //               ),
                //               SizedBox(
                //                 height: 12,
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Icon(Icons.content_copy),
                //                   Text(ebooks[index].halaman),
                //                   SizedBox(
                //                     width: 20,
                //                   ),
                //                   Icon(Icons.star_sharp)
                //                 ],
                //               )
                //             ],
                //           )),
                //           // FavoriteButton()
                //         ],
                //       ),
                //     );
                //
                //
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///widget atas scroll ke samping
  Widget myEbook(EbookData ebook) {
    return Container(
      width: 122,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            ///beralih ke halaman detail
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EbookDetail(ebook: ebook)));
              },
            ),
            width: 121.66,
            height: 180.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(ebook.cover), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            ebook.judul,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}

// class _AddButton extends StatelessWidget {
//   final EbookData item;
//
//   const _AddButton({required this.item, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     var isInFavoritePage = context.select<FavoritePageModel, bool>(
//         (favoritepage) => favoritepage.items.constains(item)
//     );
//
//     return IconButton(
//         icon: isInFavoritePage
//             ? Icon(Icons.favorite, color: Colors.red,)
//             : Icon(Icons.favorite_border),
//         onPressed: isInFavoritePage
//             ? () {
//           var favoritepage = context.read<FavoritePageModel>();
//           favoritepage.remove(item);
//         }
//             : () {
//           var favoritepage = context.read<FavoritePageModel>();
//           favoritepage.add(item);
//         }
//     );
//   }
// }
