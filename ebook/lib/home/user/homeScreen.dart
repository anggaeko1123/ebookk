import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/home/user/SimpanData/list_item.dart';
import 'package:myflutterapp/home/user/SimpanData/pageSimpan.dart';
import 'package:myflutterapp/home/user/data/dummyData.dart';
import 'package:myflutterapp/home/user/data/dataEbook.dart';
import 'package:myflutterapp/home/user/data/ebook_provider.dart';
import 'package:myflutterapp/home/user/detailEbook.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _pageContoller = PageController(viewportFraction: 0.877);
  double currentPage = 0;

  @override
  void initState(){
    _pageContoller.addListener(() {
      setState(() {
        currentPage = _pageContoller.page!.toDouble();
        print(currentPage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blueAccent,
        //   centerTitle: true,
        //   title: Text('ebook'),
        //   leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.bookmark),
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return Wishlist();
        //         }));
        //       },
        //     )
        //   ],
        // ),

        // body: ListView(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(top: 20, left: 15),
        //       child: Text("Headline News"),
        //     ),
        //
        //         SingleChildScrollView(
        //           child: Padding(
        //             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 TextField(
        //                   decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       prefixIcon: Icon(Icons.search),
        //                       hintText: 'search your favorite ebook...',
        //                       border: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(8),
        //                           borderSide: BorderSide.none)
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //                 Text(
        //                   'My Ebooks',
        //                   style: TextStyle(fontSize: 20),
        //                 ),
        //                 SizedBox(
        //                   height: 12,
        //                 ),
        //                 Container(
        //                   height: 200,
        //                   child: PageView(
        //                     /// boucingscrollphysics() membuat efek mantul saat discroll ke samping
        //                     physics: BouncingScrollPhysics(),
        //                     controller: _pageContoller,
        //
        //                     /// membuat pageview dapat di scroll ke samping
        //                     scrollDirection: Axis.horizontal,
        //                     children: [
        //                       Container(
        //                         margin: EdgeInsets.only(right: 15),
        //                         width: 350,
        //                         height: 200,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(15),
        //                           image: DecorationImage(
        //                             fit: BoxFit.cover,
        //                             image: NetworkImage(
        //                               "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //
        //                       Container(
        //                         margin: EdgeInsets.only(right: 15),
        //                         width: 350,
        //                         height: 200,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(15),
        //                           image: DecorationImage(
        //                             fit: BoxFit.cover,
        //                             image: NetworkImage(
        //                               "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //
        //                       Container(
        //                         margin: EdgeInsets.only(right: 15),
        //                         width: 350,
        //                         height: 200,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(15),
        //                           image: DecorationImage(
        //                             fit: BoxFit.cover,
        //                             image: NetworkImage(
        //                               "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //
        //     Padding(
        //         padding: EdgeInsets.only(top: 15, left: 15),
        //       child: Text('List Ebook'),
        //     ),
        //
        //     Padding(
        //       padding: EdgeInsets.all(20),
        //       child: const DummyData(),
        //       // child: ListView.builder(
        //       //   itemBuilder: (context, int index) {
        //       //     final EbookData ebook = ebooks[index];
        //       //     return InkWell(
        //       //       onTap: () {
        //       //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       //           return EbookDetail(
        //       //             ebook: ebooks[index],
        //       //           );
        //       //         }));
        //       //       },
        //       //       child: Consumer<EbookProvider>(
        //       //         builder: (context, EbookProvider data, widget) {
        //       //           return ListItem(
        //       //               ebook: ebook,
        //       //               isDone: data.myList.contains(ebook),
        //       //               onCheckboxClick: (bool? value) {
        //       //                 setState(() {
        //       //                   if (value != null) {
        //       //                     value
        //       //                         ? data.myList.add(ebook)
        //       //                         : data.myList.remove(ebook);
        //       //                   }
        //       //                 });
        //       //               });
        //       //         },
        //       //       ),
        //       //     );
        //       //   },
        //       //   itemCount: ebooks.length,
        //       // ),
        //     )
        //
        //   ],
        // ),

      // body: SafeArea(
      //   body: ListView(
      //     children: [
      //       Container(
      //         height: 200,
      //         child: PageView(
      //           /// boucingscrollphysics() membuat efek mantul saat discroll ke samping
      //           physics: BouncingScrollPhysics(),
      //           controller: _pageContoller,
      //
      //           /// membuat pageview dapat di scroll ke samping
      //           scrollDirection: Axis.horizontal,
      //           children: [
      //             Container(
      //               margin: EdgeInsets.only(right: 15),
      //               width: 350,
      //               height: 200,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(15),
      //                 image: DecorationImage(
      //                   fit: BoxFit.cover,
      //                   image: NetworkImage(
      //                     "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
      //                   ),
      //                 ),
      //               ),
      //             ),
      //
      //             Container(
      //               margin: EdgeInsets.only(right: 15),
      //               width: 350,
      //               height: 200,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(15),
      //                 image: DecorationImage(
      //                   fit: BoxFit.cover,
      //                   image: NetworkImage(
      //                     "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      //                   ),
      //                 ),
      //               ),
      //             ),
      //
      //             Container(
      //               margin: EdgeInsets.only(right: 15),
      //               width: 350,
      //               height: 200,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(15),
      //                 image: DecorationImage(
      //                   fit: BoxFit.cover,
      //                   image: NetworkImage(
      //                     "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //
      //       Padding(
      //           padding: EdgeInsets.all(25),
      //         /// membuat dot indikator
      //         child: Row(
      //           children: List.generate(3, (index){
      //             return Container(
      //               margin: EdgeInsets.only(right: 5),
      //               alignment: Alignment.centerLeft,
      //               height: 9,
      //               width: 9,
      //               decoration: BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 color: currentPage == index
      //                     ? Colors.black
      //                     : Colors.black12,
      //               ),
      //             );
      //           }),
      //         ),
      //       ),
      //
      //       Padding(
      //         padding: EdgeInsets.only(top: 15,left: 15),
      //         child: Text('List Semua ebook'),
      //       ),
      //
      //       Padding(
      //         padding: EdgeInsets.all(20),
      //         child: ListView.builder(
      //           itemBuilder: (context, int index) {
      //             final EbookData ebook = ebooks[index];
      //             return InkWell(
      //               onTap: () {
      //                 Navigator.push(context, MaterialPageRoute(builder: (context) {
      //                   return EbookDetail(
      //                     ebook: ebooks[index],
      //                   );
      //                 }));
      //               },
      //               child: Consumer<EbookProvider>(
      //                 builder: (context, EbookProvider data, widget) {
      //                   return ListItem(
      //                       ebook: ebook,
      //                       isDone: data.myList.contains(ebook),
      //                       onCheckboxClick: (bool? value) {
      //                         setState(() {
      //                           if (value != null) {
      //                             value
      //                                 ? data.myList.add(ebook)
      //                                 : data.myList.remove(ebook);
      //                           }
      //                         });
      //                       });
      //                 },
      //               ),
      //             );
      //           },
      //           itemCount: ebooks.length,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
        body: ListView.builder(
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
        )
    );
  }
}
