import 'package:flutter/material.dart';
import 'package:myflutterapp/admin/tampilanAdmin.dart';
import 'package:myflutterapp/home/beranda.dart';
import 'package:myflutterapp/home/user/tampilanUser.dart';


class BottomNavBar extends StatelessWidget{
  BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.blueAccent,
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
              label: 'home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'kategori',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'pengaturan',
            ),
          ],
        ),
      ),

      // padding: EdgeInsets.only(
      //   left: 20,
      //   right: 20,
      //   bottom: 10,
      // ),
      // height: 80,
      // decoration: BoxDecoration(
      //   color: Colors.blueAccent,
      //   // boxShadow: [
      //   //   BoxShadow(
      //   //     offset: Offset(0, -10),
      //   //     blurRadius: 35,
      //   //     color: Colors.blue,
      //   //   ),
      //   // ],
      // ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.home),
      //       onPressed: () {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => Beranda()));
      //       },
      //     ),
      //     Text('beranda'),
      //
      //     IconButton(
      //       icon: Icon(Icons.category_rounded),
      //       onPressed: () {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => TampilanUser()));
      //       },
      //     ),
      //     Text('kategori'),
      //
      //     IconButton(
      //       icon: Icon(Icons.settings),
      //       onPressed: () {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => Tampil()));
      //       },
      //     ),
      //     Text('pengaturan')
      //   ],
      // ),
    );
  }
}