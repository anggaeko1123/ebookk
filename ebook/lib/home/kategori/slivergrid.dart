// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class SliverGrid extends StatefulWidget {
//   const SliverGrid({Key? key}) : super(key: key);
//
//   @override
//   State<SliverGrid> createState() => _SliverGridState();
// }
//
// class _SliverGridState extends State<SliverGrid> {
//
//   late final PageController pageController;
//   ScrollController _scrollController = ScrollController();
//   int pageNo = 0;
//
//   Timer? carasouelTmer;
//
//   Timer getTimer() {
//     return Timer.periodic(const Duration(seconds: 3), (timer) {
//       if (pageNo == 4) {
//         pageNo = 0;
//       }
//       pageController.animateToPage(
//         pageNo,
//         duration: const Duration(seconds: 1),
//         curve: Curves.easeInOutCirc,
//       );
//       pageNo++;
//     });
//   }
//
//   @override
//   void initState() {
//     pageController = PageController(initialPage: 0, viewportFraction: 0.85);
//     carasouelTmer = getTimer();
//     _scrollController.addListener(() {
//       if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         showBtmAppBr = false;
//         setState(() {});
//       } else {
//         showBtmAppBr = true;
//         setState(() {});
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//
//   bool showBtmAppBr = true;
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'ebook'
//           ),
//         ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           controller: _scrollController,
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 200,
//                 child: PageView.builder(
//                   controller: pageController,
//                     onPageChanged: (index){
//                         pageNo = index;
//                         setState(() {
//
//                         });
//                     },
//                     itemBuilder: (_, index){
//                         return AnimatedBuilder(
//                             animation: pageController,
//                             builder: (ctx, child){
//                               return child!;
//                             },
//                             child: GestureDetector(
//                               onTap: (){
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content:
//                                       Text('you tab at ${index + 1}'),
//                                   ),
//                                 );
//                               },
//                               onPanDown: (d) {
//                                 carasouelTmer?.cancel();
//                                 carasouelTmer = null;
//                               },
//                               onPanCancel: () {
//                                 carasouelTmer = getTimer();
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.only(
//                                     right: 8, left: 8, top: 24, bottom: 12),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   color: Colors.amberAccent,
//                                   image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.gotravelly.com%2Fblog%2Fwp-content%2Fuploads%2F2019%2F10%2FGunung-Fuji-Jepang-1024x640.jpg&imgrefurl=https%3A%2F%2Fwww.gotravelly.com%2Fblog%2Fgunung-terindah-di-dunia%2F&tbnid=_7moWYa0yb4Z6M&vet=12ahUKEwj8l9T3zdf7AhU9KbcAHXz4AgUQMygFegUIARDMAQ..i&docid=5sy7Yj22jhLvCM&w=1024&h=640&q=pemandangan&ved=2ahUKEwj8l9T3zdf7AhU9KbcAHXz4AgUQMygFegUIARDMAQ')
//                                 ),
//                               ),
//
//                             ),
//                         );
//                     },
//                   // itemCount: 5,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
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
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:myflutterapp/home/FavoriteButton/favorite_button.dart';
// // import 'package:myflutterapp/home/header.dart';
// // import 'package:myflutterapp/home/kategori/celoteh.dart';
// // import 'package:myflutterapp/home/kategori/cerpen.dart';
// // import 'package:myflutterapp/home/kategori/esai.dart';
// // import 'package:myflutterapp/home/kategori/hibernasi.dart';
// // import 'package:myflutterapp/home/kategori/memorabilia.dart';
// // import 'package:myflutterapp/home/kategori/puisi.dart';
// // import 'package:myflutterapp/home/kategori/rehal.dart';
// // import 'package:myflutterapp/home/kategori/tajjali.dart';
// // import 'package:myflutterapp/home/kategori/tokoh.dart';
// // import 'package:myflutterapp/home/user/SimpanData/list_item.dart';
// // import 'package:myflutterapp/home/user/SimpanData/pageSimpan.dart';
// // import 'package:myflutterapp/home/user/data/dataEbook.dart';
// // import 'package:myflutterapp/home/user/data/dummyData.dart';
// // import 'package:myflutterapp/home/user/data/ebook_provider.dart';
// // import 'package:myflutterapp/home/user/detailEbook.dart';
// // import 'package:myflutterapp/home/user/homeScreen.dart';
// // import 'package:provider/provider.dart';
// //
// // class SliverGridView extends StatefulWidget {
// //   SliverGridView({Key? key}) : super(key: key);
// //
// //   @override
// //   _SliverGridState createState() => _SliverGridState();
// // }
// //
// // class _SliverGridState extends State<SliverGridView> {
// //   int _currentSelection = 1;
// //   double _selectorPositionX = 16;
// //
// //   GlobalKey _key1 = GlobalKey();
// //   GlobalKey _key2 = GlobalKey();
// //   GlobalKey _key3 = GlobalKey();
// //   GlobalKey _key4 = GlobalKey();
// //   GlobalKey _key5 = GlobalKey();
// //   GlobalKey _key6 = GlobalKey();
// //   GlobalKey _key7 = GlobalKey();
// //   GlobalKey _key8 = GlobalKey();
// //   GlobalKey _key9 = GlobalKey();
// //
// //   _selectedItem(int id){
// //     _currentSelection = id;
// //     GlobalKey selectedGlobalKey;
// //     switch(id){
// //       case 1:
// //         selectedGlobalKey = _key1;
// //         break;
// //       case 2:
// //         selectedGlobalKey = _key2;
// //         break;
// //       case 3:
// //         selectedGlobalKey = _key3;
// //         break;
// //       case 4:
// //         selectedGlobalKey = _key4;
// //         break;
// //       case 5:
// //         selectedGlobalKey = _key5;
// //         break;
// //       case 6:
// //         selectedGlobalKey = _key6;
// //         break;
// //       case 7:
// //         selectedGlobalKey = _key7;
// //         break;
// //       case 8:
// //         selectedGlobalKey = _key8;
// //         break;
// //       case 9:
// //         selectedGlobalKey = _key9;
// //         break;
// //       default:
// //     }
// //
// //     // _setWidgetPositionX(selectedGlobalKey);
// //     // setState(() {});
// //   }
// //
// //   // _setWidgetPositionX(GlobalKey selectedKey) {
// //   //     final RenderBox widgetRenderBox =
// //   //         selectedKey.currentContext.findRenderObject();
// //   //     final widgetPosition = widgetRenderBox.localToGlobal(Offset.zero);
// //   //
// //   //     _selectorPositionX = widgetPosition.dx;
// //   // }
// //   //
// //   // @override
// //   // void initState(){
// //   //   super.initState();
// //   //   WidgetsBinding.instance
// //   //       .addPostFrameCallback((_) => _setWidgetPositionX(_key1));
// //   // }
// //
// //   // List<String> _categories = [
// //   //   'Celoteh',
// //   //   'Puisi',
// //   //   'Hibernasi',
// //   //   'Esai',
// //   //   'Tokoh',
// //   //   'Tajalli',
// //   //   'Cerpen',
// //   //   'Rehal',
// //   //   'Memeorabilia'
// //   // ];
// //
// //   // int _isSelected = 0;
// //   //
// //   // final _pageController = PageController(viewportFraction: 0.877);
// //   //
// //   // double currentPage = 0;
// //
// //   // bool _isFavorite = false;
// //   // int _favoriteCount = 0;
// //   //
// //   // void _toggleFavorite() {
// //   //   setState(() {
// //   //     if (_isFavorite) {
// //   //       _favoriteCount -= 1;
// //   //       _isFavorite = false;
// //   //     } else {
// //   //       _favoriteCount += 1;
// //   //       _isFavorite = true;
// //   //     }
// //   //   });
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     Widget SearchField() {
// //       return Container(
// //         margin: EdgeInsets.symmetric(horizontal: 30),
// //         child: TextField(
// //           decoration: InputDecoration(
// //               hintText: 'search your favorite book',
// //               // hintStyle: ,
// //               fillColor: Colors.grey,
// //               filled: true,
// //               border: OutlineInputBorder(
// //                   borderSide: BorderSide.none,
// //                   borderRadius: BorderRadius.all(
// //                       Radius.circular(12)
// //                   )
// //               ),
// //               isCollapsed: true,
// //               contentPadding: EdgeInsets.all(18),
// //               suffixIcon: InkWell(
// //                   onTap: () {},
// //                   child: Container(
// //                     padding: EdgeInsets.all(15),
// //                     decoration: BoxDecoration(
// //                         color: Colors.green,
// //                         borderRadius: BorderRadius.all(
// //                             Radius.circular(12)
// //                         )
// //                     ),
// //                     child: Icon(
// //                       Icons.search,
// //                       color: Colors.white,
// //                     ),
// //                   )
// //               )
// //           ),
// //         ),
// //       );
// //     }
// //
// //     Widget atas() {
// //       return SingleChildScrollView(
// //         scrollDirection: Axis.horizontal,
// //         child: Row(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.only(top: 15, left: 15),
// //               child: Container(
// //                 width: 200,
// //                 height: 150,
// //                 decoration: BoxDecoration(
// //                     color: Colors.grey,
// //                     image: DecorationImage(
// //                         image: NetworkImage(
// //                             "https://cdn.pixabay.com/photo/2016/10/19/08/57/mountains-1752433__340.jpg"),
// //                         fit: BoxFit.cover)),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(top: 15, left: 15),
// //               child: Container(
// //                 width: 200,
// //                 height: 150,
// //                 decoration: BoxDecoration(
// //                     color: Colors.grey,
// //                     image: DecorationImage(
// //                         image: NetworkImage(
// //                             "https://cdn.pixabay.com/photo/2016/08/27/14/38/mountains-1624284__340.jpg"),
// //                         fit: BoxFit.cover)),
// //               ),
// //             ),
// //           ],
// //         ),
// //       );
// //     }
// //
// //     // Widget tengah() {
// //     //   return ListView(
// //     //     children: [
// //     //       Padding(
// //     //         padding: const EdgeInsets.all(20),
// //     //         child: Text(
// //     //           "Slider\nPageView",
// //     //           style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
// //     //         ),
// //     //       ),
// //     //       Container(
// //     //         height: 200,
// //     //         child: PageView(
// //     //           //boucingscrollphysics() membuat efek mantul saat discroll ke samping
// //     //           physics: BouncingScrollPhysics(),
// //     //           controller: _pageController,
// //     //
// //     //           //membuat pageview dapat discroll ke samping
// //     //           scrollDirection: Axis.horizontal,
// //     //           children: [
// //     //             Container(
// //     //               margin: EdgeInsets.only(right: 15),
// //     //               width: 350,
// //     //               height: 200,
// //     //               decoration: BoxDecoration(
// //     //                 borderRadius: BorderRadius.circular(15),
// //     //                 image: DecorationImage(
// //     //                   fit: BoxFit.cover,
// //     //                   image: NetworkImage(
// //     //                     "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
// //     //                   ),
// //     //                 ),
// //     //               ),
// //     //             ),
// //     //             Container(
// //     //               margin: EdgeInsets.only(right: 15),
// //     //               width: 350,
// //     //               height: 200,
// //     //               decoration: BoxDecoration(
// //     //                 borderRadius: BorderRadius.circular(15),
// //     //                 image: DecorationImage(
// //     //                   fit: BoxFit.cover,
// //     //                   image: NetworkImage(
// //     //                     "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
// //     //                   ),
// //     //                 ),
// //     //               ),
// //     //             ),
// //     //             Container(
// //     //               margin: EdgeInsets.only(right: 15),
// //     //               width: 350,
// //     //               height: 200,
// //     //               decoration: BoxDecoration(
// //     //                 borderRadius: BorderRadius.circular(15),
// //     //                 image: DecorationImage(
// //     //                   fit: BoxFit.cover,
// //     //                   image: NetworkImage(
// //     //                     "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
// //     //                   ),
// //     //                 ),
// //     //               ),
// //     //             ),
// //     //           ],
// //     //         ),
// //     //       ),
// //     //       Padding(
// //     //         padding: EdgeInsets.all(25),
// //     //
// //     //         //membuat dot indicator
// //     //         child: Row(
// //     //           children: List.generate(
// //     //             3,
// //     //                 (index) {
// //     //               return Container(
// //     //                 margin: EdgeInsets.only(right: 5),
// //     //                 alignment: Alignment.centerLeft,
// //     //                 height: 9,
// //     //                 width: 9,
// //     //                 decoration: BoxDecoration(
// //     //                   shape: BoxShape.circle,
// //     //                   color: currentPage == index
// //     //                       ? Colors.black
// //     //                       : Colors.black12,
// //     //                 ),
// //     //               );
// //     //             },
// //     //           ),
// //     //         ),
// //     //       ),
// //     //     ],
// //     //   );
// //     // }
// //     //
// //     // Widget categories(int index){
// //     //   return InkWell(
// //     //     onTap: (){
// //     //       setState(() {
// //     //         _isSelected = index;
// //     //       });
// //     //     },
// //     //     child: Container(
// //     //       margin: EdgeInsets.only(top: 10, right: 12),
// //     //       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// //     //       decoration: BoxDecoration(
// //     //         color: _isSelected == index ? Colors.green : Colors.grey
// //     //       ),
// //     //       child: Text(
// //     //         _categories[index],
// //     //       ),
// //     //     ),
// //     //   );
// //     // }
// //     //
// //     // Widget listCategories(){
// //     //   return SingleChildScrollView(
// //     //     padding: EdgeInsets.only(left: 30),
// //     //     scrollDirection: Axis.horizontal,
// //     //     child: Row(
// //     //       children: _categories.asMap().entries.map((MapEntry map) => categories(map.key))
// //     //           .toList(),
// //     //     ),
// //     //   );
// //     // }
// //
// //     Widget bawah() {
// //       return ListView.builder(
// //         itemBuilder: (context, int index) {
// //           final EbookData ebook = ebooks[index];
// //           return InkWell(
// //             onTap: () {
// //               Navigator.push(context, MaterialPageRoute(builder: (context) {
// //                 return EbookDetail(
// //                   ebook: ebooks[index],
// //                 );
// //               }));
// //             },
// //             child: Consumer<EbookProvider>(
// //               builder: (context, EbookProvider data, widget) {
// //                 return ListItem(
// //                     ebook: ebook,
// //                     isDone: data.myList.contains(ebook),
// //                     onCheckboxClick: (bool? value) {
// //                       setState(() {
// //                         if (value != null) {
// //                           value
// //                               ? data.myList.add(ebook)
// //                               : data.myList.remove(ebook);
// //                         }
// //                       });
// //                     });
// //               },
// //             ),
// //           );
// //         },
// //         itemCount: ebooks.length,
// //       );
// //     }
// //
// //     // Widget bottomBar(){
// //     //   return
// //     // }
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.blueAccent,
// //         centerTitle: true,
// //         title: Text('ebook'),
// //         leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.bookmark),
// //             onPressed: () {
// //               Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) {
// //                     return Wishlist();
// //                   })
// //               );
// //             },
// //           )
// //         ],
// //       ),
// //
// //       body: ListView(
// //         children: [
// //           Header(),
// //           Stack(
// //             children: [
// //               Container(
// //                 margin: EdgeInsets.only(left: 16, right: 12),
// //                 child: Row(
// //                   children: [
// //                     InkWell(
// //                       key: _key1,
// //                       onTap: () => _selectedItem(1),
// //                       child: Text('Hibernasi'),
// //                     ),
// //                     SizedBox(width: 12,),
// //
// //                     InkWell(
// //                       key: _key2,
// //                       onTap: () => _selectedItem(2),
// //                       child: Text('Tokoh'),
// //                     ),
// //                     SizedBox(width: 12,),
// //
// //                     InkWell(
// //                       key: _key3,
// //                       onTap: () => _selectedItem(3),
// //                       child: Text('Rehal'),
// //                     ),
// //                     SizedBox(width: 12,),
// //
// //                     InkWell(
// //                       key: _key4,
// //                       onTap: () => _selectedItem(4),
// //                       child: Text('Tajjali'),
// //                     ),
// //                     SizedBox(width: 12,),
// //
// //                     InkWell(
// //                       key: _key5,
// //                       onTap: () => _selectedItem(5),
// //                       child: Text('Esai'),
// //                     ),
// //                     SizedBox(width: 12,),
// //
// //                     InkWell(
// //                       key: _key6,
// //                       onTap: () => _selectedItem(6),
// //                       child: Text('Cerpen'),
// //                     ),
// //                     SizedBox(width: 12,),
// //
// //                     InkWell(
// //                       key: _key7,
// //                       onTap: () => _selectedItem(7),
// //                       child: Text('Celoteh'),
// //                     ),
// //                     SizedBox(width: 12,),
// //
// //                     InkWell(
// //                       key: _key8,
// //                       onTap: () => _selectedItem(8),
// //                       child: Text('Puisi'),
// //                     ),
// //                     SizedBox(width: 12,),
// //
// //                     InkWell(
// //                       key: _key9,
// //                       onTap: () => _selectedItem(9),
// //                       child: Text('Memorabilia'),
// //                     ),
// //                     SizedBox(width: 12,),
// //                   ],
// //                 ),
// //               ),
// //
// //               AnimatedPositioned(
// //                   duration: Duration(
// //                       milliseconds: 400
// //                   ),
// //                 curve: Curves.fastOutSlowIn,
// //                 left: _selectorPositionX,
// //                 bottom: 4,
// //                 child: Container(
// //                   width: 30,
// //                   height: 4,
// //                   decoration: ShapeDecoration(
// //                     shape: StadiumBorder(),
// //                     color: Colors.green
// //                   ),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ],
// //       ),
// //
// //       // body: ListView.builder(
// //       //     itemBuilder: (context, index){
// //       //       final EbookData ebook = ebooks[index];
// //       //       return Column(
// //       //         mainAxisAlignment: MainAxisAlignment.start,
// //       //         crossAxisAlignment: CrossAxisAlignment.start,
// //       //         children: [
// //       //           SearchField(),
// //       //           Padding(
// //       //               padding: EdgeInsets.symmetric(horizontal: 30),
// //       //               child: Text(
// //       //                 'Recent Book',
// //       //                 style: TextStyle(
// //       //                     fontWeight: FontWeight.bold,
// //       //                     fontSize: 16,
// //       //                     color: Colors.black
// //       //                 ),
// //       //               )
// //       //           ),
// //       //           atas(),
// //       //           SizedBox(
// //       //             height: 12,
// //       //           ),
// //       //           Row(
// //       //             mainAxisAlignment: MainAxisAlignment.start,
// //       //             crossAxisAlignment: CrossAxisAlignment.start,
// //       //             children: [
// //       //               Container(
// //       //                 ///beralih ke halaman detail
// //       //                 child: InkWell(
// //       //                   onTap: () {
// //       //                     Navigator.push(
// //       //                         context,
// //       //                         MaterialPageRoute(
// //       //                             builder: (context) => EbookDetail(
// //       //                               ebook: ebooks[index],
// //       //                             )));
// //       //                   },
// //       //                   // child: Consumer<EbookProvider>(
// //       //                   //   builder: (context, EbookProvider data, widget){
// //       //                   //     return ListItem(
// //       //                   //
// //       //                   //     )
// //       //                   //   },
// //       //                   // ),
// //       //                 ),
// //       //                 margin: EdgeInsets.only(right: 8),
// //       //                 height: 125,
// //       //                 width: 83,
// //       //                 decoration: BoxDecoration(
// //       //                     borderRadius: BorderRadius.circular(8),
// //       //                     image: DecorationImage(
// //       //                         image: NetworkImage(ebook.cover),
// //       //                         fit: BoxFit.cover)),
// //       //               ),
// //       //               Expanded(
// //       //                   child: Column(
// //       //                     mainAxisAlignment: MainAxisAlignment.start,
// //       //                     crossAxisAlignment: CrossAxisAlignment.start,
// //       //                     children: [
// //       //                       Text(
// //       //                         ebook.judul,
// //       //                         style: TextStyle(
// //       //                             fontSize: 20, fontWeight: FontWeight.bold),
// //       //                       ),
// //       //                       Text(
// //       //                         'rating : ' + ebook.rating,
// //       //                         style: TextStyle(fontSize: 18),
// //       //                       ),
// //       //                       SizedBox(
// //       //                         height: 12,
// //       //                       ),
// //       //                       Row(
// //       //                         mainAxisAlignment: MainAxisAlignment.start,
// //       //                         crossAxisAlignment: CrossAxisAlignment.center,
// //       //                         children: [
// //       //                           Icon(Icons.content_copy),
// //       //                           Text(ebook.halaman),
// //       //                           SizedBox(
// //       //                             width: 20,
// //       //                           ),
// //       //                           Icon(Icons.star_sharp)
// //       //                         ],
// //       //                       )
// //       //                     ],
// //       //                   )
// //       //               ),
// //       //               // FavoriteButton()
// //       //             ],
// //       //           )
// //       //         ],
// //       //       );
// //       //     }
// //       // ),
// //
// //       // body: ListView(
// //       //   children: [
// //       //     Container(
// //       //       padding: EdgeInsets.symmetric(vertical: 30),
// //       //       decoration: BoxDecoration(
// //       //           color: Colors.white,
// //       //           borderRadius: BorderRadius.only(
// //       //             bottomLeft: Radius.circular(30),
// //       //           )
// //       //       ),
// //       //       child: Column(
// //       //         children: [
// //       //           SearchField(),
// //       //           atas(),
// //       //         ],
// //       //       ),
// //       //     ),
// //       //     listCategories(),
// //       //     TabBarView(
// //       //         children: [
// //       //           Celoteh(),
// //       //           Puisi(),
// //       //           Memorabilia(),
// //       //           Hibernasi(),
// //       //           Esai(),
// //       //           Tajjali(),
// //       //           Cerpen(),
// //       //           Rehal(),
// //       //           Tokoh()
// //       //         ]
// //       //     ),
// //       //   ],
// //       // ),
// //     );
// //   }
// //
// //   ///widget atas scroll ke samping
// //   Widget myEbook(EbookData ebook) {
// //     return Container(
// //       width: 122,
// //       margin: EdgeInsets.only(right: 12),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Container(
// //
// //             ///beralih ke halaman detail
// //             child: InkWell(
// //               onTap: () {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                         builder: (context) => EbookDetail(ebook: ebook)));
// //               },
// //             ),
// //             width: 121.66,
// //             height: 180.5,
// //             decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(8),
// //                 image: DecorationImage(
// //                     image: NetworkImage(ebook.cover), fit: BoxFit.cover)),
// //           ),
// //           SizedBox(
// //             height: 12,
// //           ),
// //           Text(
// //             ebook.judul,
// //             style: TextStyle(fontSize: 14),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
