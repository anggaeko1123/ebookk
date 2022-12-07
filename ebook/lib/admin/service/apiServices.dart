import 'package:myflutterapp/admin/service/apiModelEbook.dart';
import 'package:http/http.dart' as http;

class ApiService{
  static final String _baseUrl = 'https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data';

  Future getData() async{
    Uri urlApi = Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if(response.statusCode == 200){
      return dataDummyFromJson(response.body.toString());
    }
    else{
      throw Exception("Failed to load data");
    }
  }
}






// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:myflutterapp/admin/service/apiModelEbook.dart';
//
// class ApiService {
//   static final String _url = 'https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data';
//
//   static Future<List<Datum>> getData() async{
//     List<Datum> listData = [];
//     final response = await http.get(Uri.parse('$_url'));
//
//     if(response.statusCode == 200){
//       final json = jsonDecode(response.body);
//       EbookModel ebookModel = EbookModel.fromJson(json);
//
//       ebookModel.data.forEach((item) {
//         listData.add(item);
//       });
//
//       return listData;
//     }else{
//       return[
//       ];
//     }
//   }
// }