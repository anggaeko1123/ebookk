import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/nyobaApi/model.dart';

class ApiService {
  static final String _url = 'https://625a05cb43fda1299a14aa37.mockapi.io/api/v1';

  static Future<List<Datum>> getWisata() async{
    List<Datum> listWisata = [];
    final response = await http.get(Uri.parse('$_url/tourism-places'));

    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      TourismPlaceModel tourismPlaceModel = TourismPlaceModel.fromJson(json);

      tourismPlaceModel.data.forEach((item) {
        listWisata.add(item);
      });

      return listWisata;
    }else{
      return[
      ];
    }
  }
}











// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:myflutterapp/remote/apiModel.dart';
//
// class ApiService {
//   static final String _url = 'https://633fdc42e44b83bc73c2d9be.mockapi.io/api/api';
//
//   static Future<List<ApiModel>> getData() async{
//     List<ApiModel> listData = [];
//     final response = await http.get(Uri.parse('$_url/tourism-places'));
//
//     if(response.statusCode == 200){
//       final json = jsonDecode(response.body);
//       ModelEbook modelEbook = ModelEbook.fromJson(json);
//
//       modelEbook.data.forEach((item) {
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













// import 'dart:convert';
//
// import 'package:myflutterapp/remote/apiModel.dart';
// import 'package:http/http.dart' as http;
//
// class ApiService{
//   final _baseUrl = 'https://633fdc42e44b83bc73c2d9be.mockapi.io/api';
//
//   Future getData() async{
//     try{
//       final response = await http.get(Uri.parse(_baseUrl));
//
//       if(response.statusCode == 200){
//         print(response.body);
//         Iterable it = jsonDecode(response.body);
//         List<ApiModel> api = it.map((e) => ApiModel.fromJson(e)).toList();
//         return api;
//       }
//     }
//     catch(e){
//       print(e.toString());
//     }
//   }
// }
//
//
//
//
//
// // class ApiService{
// //   Future<List<ApiModel>> getApi() async{
// //     try{
// //       final response = await http.get(Uri.parse("http://localhost/rest-api/loginregister/index.php/api/data"));
// //
// //         if(response.statusCode == 200){
// //           List<dynamic> json = jsonDecode(response.body);
// //           return List<ApiModel>.from(json.map((e) => ApiModel.fromJson(e)));
// //           // return apiModelFromJson(response.body);
// //         }
// //         else{
// //           return [];
// //         }
// //       }
// //       catch (e){
// //       return [];
// //     }
// //   }
// // }