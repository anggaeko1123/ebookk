import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/admin/model/dataModel.dart';
import 'package:myflutterapp/home/beranda.dart';
import 'package:myflutterapp/home/kategori/celoteh.dart';
import 'package:myflutterapp/home/kategori/esai.dart';
import 'package:myflutterapp/home/kategori/hibernasi.dart';
import 'package:myflutterapp/home/kategori/slivergrid.dart';
import 'package:myflutterapp/home/user/SimpanData/pageSimpan.dart';
import 'package:myflutterapp/home/user/homePage.dart';
import 'package:myflutterapp/home/user/homeScreen.dart';

class BottomNavBar extends StatefulWidget{

  @override
  State<BottomNavBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavBar>{
  late DataModel data;

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index){
              setState((){
                _currentIndex = index;
              });
            },
            children: [
              HomePage(),
              Beranda(),
              HomeScreen(),
              Wishlist(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.blue,
          selectedIndex: _currentIndex,
          onItemSelected: (index){
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(Icons.home, color: Colors.white,),
                title: Text('Home'),
                activeColor: Colors.white
            ),

            BottomNavyBarItem(
                icon: Icon(Icons.abc, color: Colors.white,),
                title: Text('Basa-Basi'),
                activeColor: Colors.white
            ),

            BottomNavyBarItem(
                icon: Icon(Icons.list, color: Colors.white,),
                title: Text('Wishlist'),
                activeColor: Colors.white
            ),

            BottomNavyBarItem(
                icon: Icon(Icons.settings,),
                title: Text('Pengaturan'),
              activeColor: Colors.white
            ),
          ],
        ),
      ),
    );
  }
}

class TopNavBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //untuk mengahpus banner debug
      debugShowCheckedModeBanner: false,

      //untuk memberi warna hijau pada appbar
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      //untuk membuat tabcontroller pertama kita menggunakan defaultabcontroller
      home: DefaultTabController(

        //menentukan total tab
        length: 5,

        child: Scaffold(
          appBar: AppBar(
            // tambahkan tabbar di bawah bottom agar membuat tab bar di bawah title appbar
            bottom: TabBar(
              tabs: [
                //membuat tabbar dengan text
                Tab( text: "Flights"),

                //membuat tabbar dengan icon
                Tab(icon: Icon(Icons.train)),

                //membuat tabbar dengan text dan icon
                Tab(text: "Hotels", icon: Icon(Icons.hotel),),

                Tab(text: "Foods"),

                Tab(text: "Parks"),

              ],
              //jika tab bar terlalu panjang dapat discroll ke samping
              isScrollable: true,

              //menentukan padding label sehingga memberikan jarak kiri dan kanan sebesar 30
              labelPadding: EdgeInsets.only(left: 30, right: 30),

              //jika label tidak diselect maka akan diberi warna kuning
              unselectedLabelColor: Colors.yellow,
            ),

            title: Text('Flutter TabBar'),
          ),

          //gunakanm tabbarview untuk membuat isi dari setiap tab
          //pastikan jumlah tab dan jumlah isi sama agar tidak terjadi error
          //kalian boleh mengisi tabbarview secara custom
          body: TabBarView(
            children: [
              Center(
                child: Hibernasi(),
              ),
              Esai(),
              Center(
                child: Text("Hotels"),
              ),
              Center(
                child: Text("Foods"),
              ),
              Center(
                child: Text("Parks"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}