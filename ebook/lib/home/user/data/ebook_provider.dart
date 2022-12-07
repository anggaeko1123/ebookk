import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:myflutterapp/home/user/data/dataEbook.dart';


class EbookProvider with ChangeNotifier{
  final List<EbookData> _myList = [];

  List<EbookData> get myList => _myList;

  void complete(EbookData ebook, bool isDone){
    isDone
        ? _myList.add(ebook)
        : _myList.remove(ebook);
    notifyListeners();
  }
}