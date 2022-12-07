import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 250,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text(
          'header',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(const Header());
// }
//
// class Header extends StatefulWidget {
//   const Header({Key? key}) : super(key: key);
//
//   @override
//   State<Header> createState() => _HeaderState();
// }
//
// class _HeaderState extends State<Header> {
//
//   //viewport as margin left
//   final _pageController = PageController(viewportFraction: 0.877);
//
//   double currentPage = 0;
//
//   //indicator handler
//   @override
//   void initState() {
//     //pagecontroller dibuat selalu listening
//     //setiap pageview discrollke samping maka akan mengambil index page
//     _pageController.addListener(() {
//       setState(() {
//         currentPage = _pageController.page!.toDouble();
//         print(currentPage);
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SafeArea(
//           child: ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text(
//                   "Slider\nPageView",
//                   style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
//                 ),
//               ),
//               Container(
//                 height: 200,
//                 child: PageView(
//                   //boucingscrollphysics() membuat efek mantul saat discroll ke samping
//                   physics: BouncingScrollPhysics(),
//                   controller: _pageController,
//
//                   //membuat pageview dapat discroll ke samping
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(right: 15),
//                       width: 350,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(
//                             "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(right: 15),
//                       width: 350,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(
//                             "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(right: 15),
//                       width: 350,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(
//                             "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(25),
//
//                 //membuat dot indicator
//                 child: Row(
//                   children: List.generate(
//                     3,
//                         (index) {
//                       return Container(
//                         margin: EdgeInsets.only(right: 5),
//                         alignment: Alignment.centerLeft,
//                         height: 9,
//                         width: 9,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: currentPage == index
//                               ? Colors.black
//                               : Colors.black12,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }