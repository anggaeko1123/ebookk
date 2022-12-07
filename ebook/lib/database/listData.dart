import 'package:flutter/material.dart';
import 'package:myflutterapp/database/formData.dart';
import 'package:myflutterapp/database/db_helper.dart';
import 'package:myflutterapp/database/data.dart';

class ListDataPage extends StatefulWidget {
  const ListDataPage({ Key? key }) : super(key: key);

  @override
  _ListDataPageState createState() => _ListDataPageState();
}

class _ListDataPageState extends State<ListDataPage> {
  List<Data> listData = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    //menjalankan fungsi getallData saat pertama kali dimuat
    _getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(
          child: Text("Data App"),
        ),
      ),
      body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            Data data = listData[index];
            return Padding(
              padding: const EdgeInsets.only(
                  top: 20
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 50,
                ),
                title: Text(
                    '${data.judul}'
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Email: ${data.kategori}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Phone: ${data.tahun}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Company: ${data.rating}"),
                    )
                  ],
                ),
                trailing:
                FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      // button edit
                      IconButton(
                          onPressed: () {
                            _openFormEdit(data);
                          },
                          icon: Icon(Icons.edit)
                      ),
                      // button hapus
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){
                          //membuat dialog konfirmasi hapus
                          AlertDialog hapus = AlertDialog(
                            title: Text("Information"),
                            content: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                      "Yakin ingin Menghapus Data ${data.judul}"
                                  )
                                ],
                              ),
                            ),
                            //terdapat 2 button.
                            //jika ya maka jalankan _deletedata() dan tutup dialog
                            //jika tidak maka tutup dialog
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    _deleteData(data, index);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ya")
                              ),
                              TextButton(
                                child: Text('Tidak'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                          showDialog(context: context, builder: (context) => hapus);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      //membuat button mengapung di bagian bawah kanan layar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _openFormCreate();
        },
      ),

    );
  }

  //mengambil semua data data
  Future<void> _getAllData() async {
    //list menampung data dari database
    var list = await db.getAllData();

    //ada perubahanan state
    setState(() {
      //hapus data pada listdata
      listData.clear();

      //lakukan perulangan pada variabel list
      list!.forEach((data) {

        //masukan data ke listdata
        listData.add(data.fromMap(data));
      });
    });
  }

  //menghapus data data
  Future<void> _deleteData(Data data, int position) async {
    await db.deleteData(data.id!);
    setState(() {
      listData.removeAt(position);
    });
  }

  // membuka halaman tambah data
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormData()));
    if (result == 'save') {
      await _getAllData();
    }
  }

  //membuka halaman edit data
  Future<void> _openFormEdit(Data data) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormData(data: data)));
    if (result == 'update') {
      await _getAllData();
    }
  }
}