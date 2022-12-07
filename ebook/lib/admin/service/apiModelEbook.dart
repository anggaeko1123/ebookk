import 'dart:convert';

List<DataDummy> dataDummyFromJson(String str) => List<DataDummy>.from(json.decode(str).map((x) => DataDummy.fromJson(x)));

String dataDummyToJson(List<DataDummy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataDummy {
  DataDummy({
    required this.judul,
    required this.cover,
    required this.tahun,
    required this.kategori,
    required this.deskripsi,
    required this.isi,
    required this.rating,
    required this.id,
  });

  String judul;
  String cover;
  String tahun;
  String kategori;
  String deskripsi;
  String isi;
  String rating;
  String id;

  factory DataDummy.fromJson(Map<String, dynamic> json) => DataDummy(
    judul: json["judul"],
    cover: json["cover"],
    tahun: json["tahun"],
    kategori: json["kategori"],
    deskripsi: json["deskripsi"],
    isi: json["isi"],
    rating: json["rating"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "judul": judul,
    "cover": cover,
    "tahun": tahun,
    "kategori": kategori,
    "deskripsi": deskripsi,
    "isi": isi,
    "rating": rating,
    "id": id,
  };
}









// import 'dart:convert';
//
// EbookModel ebookModelFromJson(String str) => EbookModel.fromJson(json.decode(str));
//
// String ebookModelToJson(EbookModel data) => json.encode(data.toJson());
//
// class EbookModel {
//   EbookModel({
//     required this.data,
//     required this.totalResult,
//   });
//
//   List<Datum> data;
//   int totalResult;
//
//   factory EbookModel.fromJson(Map<String, dynamic> json) => EbookModel(
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     totalResult: json["totalResult"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "totalResult": totalResult,
//   };
// }
//
// class Datum {
//   Datum({
//     required this.judul,
//     required this.cover,
//     required this.tahun,
//     required this.kategori,
//     required this.deskripsi,
//     required this.isi,
//     required this.rating,
//     required this.id,
//   });
//
//   String judul;
//   String cover;
//   String tahun;
//   String kategori;
//   String deskripsi;
//   String isi;
//   String rating;
//   String id;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     judul: json["judul"],
//     cover: json["cover"],
//     tahun: json["tahun"],
//     kategori: json["kategori"],
//     deskripsi: json["deskripsi"],
//     isi: json["isi"],
//     rating: json["rating"],
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "judul": judul,
//     "cover": cover,
//     "tahun": tahun,
//     "kategori": kategori,
//     "deskripsi": deskripsi,
//     "isi": isi,
//     "rating": rating,
//     "id": id,
//   };
// }
//
// class Gallery {
//   Gallery({
//     required this.src,
//   });
//
//   String src;
//
//   factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
//     src: json["src"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "src": src,
//   };
// }