import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _words = [];
  List<String> get words => _words;

  void toggleFavorite(String word) {
    final isExist = _words.contains(word);
    if (isExist) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }

  bool isExist(String word) {
    final isExist = _words.contains(word);
    return isExist;
  }

  void clearFavorite() {
    _words = [];
    notifyListeners();
  }

  static FavoriteProvider of(
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}













// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class SimpanProvider extends ChangeNotifier{
//   List<String> _emote = [];
//   List<String> get emotes => _emote;
//
//   void toggleSimpan(String word){
//     final isExist = _emote.contains(emotes);
//     if(isExist){
//       _emote.remove(emotes);
//     }
//     else{
//       _emote.add(emotes);
//     }
//     notifyListeners();
//   }
//
//   bool isExist(String emotes){
//     final isExist = _emote.contains(emotes);
//     return isExist;
//   }
//
//   void clearSimpan(){
//     _emote = [];
//     notifyListeners();
//   }
//
//   static SimpanProvider of(BuildContext context, {
//     bool listen = true
// }){
//     return Provider.of<SimpanProvider>(
//       context,
//       listen: listen
//     );
//   }
// }