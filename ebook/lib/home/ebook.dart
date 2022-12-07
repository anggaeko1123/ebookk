import 'package:flutter/material.dart';
import 'package:myflutterapp/home/kategori/celoteh.dart';
import 'package:myflutterapp/home/kategori/memorabilia.dart';
import 'package:myflutterapp/home/kategori/puisi.dart';
import 'package:myflutterapp/admin/crud/inputData.dart';


class Ebook extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///untuk mengahpus banner debug
      debugShowCheckedModeBanner: false,

      ///untuk memberi warna hijau pada appbar
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      ///untuk membuat tabcontroller pertama kita menggunakan defaultabcontroller
      home: DefaultTabController(
        ///menentukan total tab
        length: 3,

        child: Scaffold(
          appBar: AppBar(
            /// tambahkan tabbar di bawah bottom agar membuat tab bar di bawah title appbar
            bottom: TabBar(
              tabs: [

                ///membuat tabbar dengan text
                Tab(text: "Celoteh"),
                Tab(text: "Puisi"),
                Tab(text: "Memorabilia"),
              ],

              ///jika tab bar terlalu panjang dapat discroll ke samping
              isScrollable: true,

              ///menentukan padding label sehingga memberikan jarak kiri dan kanan sebesar 30
              labelPadding: EdgeInsets.only(left: 30, right: 30),

              ///jika label tidak diselect maka akan diberi warna kuning
              unselectedLabelColor: Colors.white,
            ),

            title: Text('Ebook'),
            actions: <Widget>[
              IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.search)
              )
            ],
          ),

          ///gunakanm tabbarview untuk membuat isi dari setiap tab
          ///pastikan jumlah tab dan jumlah isi sama agar tidak terjadi error
          ///kalian boleh mengisi tabbarview secara custom
          body: TabBarView(
            children: [

              ///memanggil class pada halaman lain
              Celoteh(),
              Puisi(),
              Memorabilia(),
            ],

          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async{
              Navigator.push(context,
                  MaterialPageRoute(
                      builder:(context) => TambahData()
                  )
              );
            },
          ),

          drawer: _buildDrawer(),
        ),
      ),

    );
  }

  Widget _buildDrawer(){
    return SizedBox(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image(
                image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
              ),
              accountName: Text("Angga EP"),
              accountEmail: Text("ig: anggaekop_"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://cdn.pixabay.com/photo/2016/04/24/20/52/laundry-1350593_960_720.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.maps_home_work),
              title: Text("Home"),
            )
          ],
        ),
      ),
    );
  }
}