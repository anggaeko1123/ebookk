// ignore_for_file: non_constant_identifier_names


//dbhelper ini dibuat untuk
//membuat database, membuat tabel, proses insert, read, update dan delete

import 'package:myflutterapp/database/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  //inisialisasi beberapa variabel yang dibutuhkan
  final String tableName = 'tableData';
  final String columnId = 'id';
  final String columnJudul = 'judul';
  final String columnCover = 'cover';
  final String columnTahun = 'tahun';
  final String columnKategori = 'kategori';
  final String columnDeskripsi = 'deskripsi';
  final String columnIsi = 'isi';
  final String columnRating = 'rating';

  DbHelper._internal();
  factory DbHelper() => _instance;

  //cek apakah database ada
  Future<Database?> get _db  async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'data.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //membuat tabel dan field-fieldnya
  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnJudul VARCHAR,"
        "$columnCover VARCHAR,"
        "$columnTahun VARCHAR,"
        "$columnKategori VARCHAR,"
        "$columnDeskripsi VARCHAR,"
        "$columnIsi VARCHAR,"
        "$columnRating VARCHAR";
    await db.execute(sql);
  }

  //insert ke database
  Future<int?> saveData(Data data) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, data.toMap());
  }

  //read database
  Future<List?> getAllData() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnJudul,
      columnCover,
      columnTahun,
      columnKategori,
      columnDeskripsi,
      columnIsi,
      columnRating
    ]);

    return result.toList();
  }

  //update database
  Future<int?> updateData(Data data) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, data.toMap(), where: '$columnId = ?', whereArgs: [data.id]);
  }

  //hapus database
  Future<int?> deleteData(int id) async {
    var dbClient = await _db;
    return await dbClient!.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}










// import 'package:myflutterapp/database/data.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
//
// class DbHelper {
//   static final DbHelper _instance = DbHelper._internal();
//   static Database? _database;
//
//   //inisialisasi beberapa variabel yg dibutuhkan
//   final String tableName = 'tableData';
//   final String columnId = 'id';
//   final String columnJudul = 'judul';
//   final String columnCover = 'cover';
//   final String columnTahun = 'tahun';
//   final String columnKategori = 'kategori';
//   final String columnDeskripsi = 'deskripsi';
//   final String columnIsi = 'isi';
//   final String columnRating = 'rating';
//
//   DbHelper._internal();
//   factory DbHelper() => _instance;
//
//   //cek apakah database ada
//   Future<Database?> _initDb() async{
//     String databasePath = await getDatabasesPath();
//     String path = join(databasePath, 'data.db');
//
//     return await openDatabase( path, version: 1, onCreate: _onCreate);
//   }
//
//   //membuat tabel dan fieldnya
//   Future<void> _onCreate(Database db, int version) async{
//     var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,"
//         "$columnJudul VARCHAR,"
//         "$columnCover VARCHAR,"
//         "$columnTahun VARCHAR,"
//         "$columnKategori VARCHAR,"
//         "$columnDeskripsi VARCHAR,"
//         "$columnIsi VARCHAR,"
//         "$columnRating VARCHAR";
//     await db.execute(sql);
//   }
//
//   //insert ke database
//   Future<int?> saveData(Data data) async{
//     var _db;
//     var dbClient = await _db;
//     return await dbClient!.query(tableName, columns:[
//       columnId,
//       columnJudul,
//       columnCover,
//       columnTahun,
//       columnKategori,
//       columnDeskripsi,
//       columnIsi,
//       columnRating
//     ]);
//
//     return result.toList();
//   }
//
//   //update database
//   Future<int> updateData(Data data) async{
//     var dbClient = await _db;
//     return await dbClient!.update(tableName, data.toMap(), where: '$id = ?', whereArgs: [data.id]);
// }
//
//   //hapus database
//   Future<int?> deleteData(int id) async{
//     var dbClient = await _db;
//     return await dbClient!.delete(tableName, where: '$id = ?', whereArgs: [id]);
//   }
// }