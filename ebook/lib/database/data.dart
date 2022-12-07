class Data{
  int? id;
  String? judul;
  String? cover;
  String? tahun;
  String? kategori;
  String? deskripsi;
  String? isi;
  String? rating;

  Data({
    this.id,
    this.judul,
    this.cover,
    this.tahun,
    this.kategori,
    this.deskripsi,
    this.isi,
    this.rating
});

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    if(id != null){
      map['id'] = id;
    }

    map['judul'] = judul;
    map['cover'] = cover;
    map['tahun'] = tahun;
    map['kategori'] = kategori;
    map['deskripsi'] = deskripsi;
    map['isi'] = isi;
    map['rating'] = rating;

    return map;
  }
  Data.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.judul = map['judul'];
    this.cover = map['cover'];
    this.tahun = map['tahun'];
    this.kategori = map['kategori'];
    this.deskripsi = map['deskripsi'];
    this.isi = map['isi'];
    this.rating = map['rating'];
  }
}