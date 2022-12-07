import 'package:myflutterapp/nyobaApi/models/dataDummy.dart';
import 'package:http/http.dart' as http;

class DataService{
  static final String _baseUrl = 'https://633fdc42e44b83bc73c2d9be.mockapi.io/api/api';

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