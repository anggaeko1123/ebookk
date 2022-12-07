import 'dart:convert';

TourismPlaceModel tourismPlaceModelFromJson(String str) => TourismPlaceModel.fromJson(json.decode(str));

String tourismPlaceModelToJson(TourismPlaceModel data) => json.encode(data.toJson());

class TourismPlaceModel {
  TourismPlaceModel({
    required this.data,
    required this.totalResult,
  });

  List<Datum> data;
  int totalResult;

  factory TourismPlaceModel.fromJson(Map<String, dynamic> json) => TourismPlaceModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    totalResult: json["totalResult"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "totalResult": totalResult,
  };
}

class Datum {
  Datum({
    required this.name,
    required this.location,
    required this.mainImage,
    required this.open,
    required this.hours,
    required this.ticket,
    required this.description,
    required this.gallery,
    required this.id,
  });

  String name;
  String location;
  String mainImage;
  String open;
  String hours;
  String ticket;
  String description;
  List<Gallery> gallery;
  String id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    location: json["location"],
    mainImage: json["main-image"],
    open: json["open"],
    hours: json["hours"],
    ticket: json["ticket"],
    description: json["description"],
    gallery: List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "location": location,
    "main-image": mainImage,
    "open": open,
    "hours": hours,
    "ticket": ticket,
    "description": description,
    "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
    "id": id,
  };
}

class Gallery {
  Gallery({
    required this.src,
  });

  String src;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    src: json["src"],
  );

  Map<String, dynamic> toJson() => {
    "src": src,
  };
}