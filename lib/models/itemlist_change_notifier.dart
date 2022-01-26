import 'package:android_task/models/item_model.dart';
import 'package:flutter/cupertino.dart';

class ItemListChangeNotifier extends ChangeNotifier{
  List<ItemModel> listofitems = [];

  void addNewItemToList(ItemModel newItem){
    listofitems.add(newItem);
    notifyListeners();
  }
}