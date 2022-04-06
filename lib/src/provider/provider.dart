import 'package:flutter/material.dart';

import '../model/model.dart';

class DataProvider extends ChangeNotifier {
  List<DataModel> data = [];

  addData(String name, String email) {
    var newData = DataModel(email: email, name: name);

    data.add(newData);
    notifyListeners();
  }

  deleteData(index) {
    data.removeAt(index);
    notifyListeners();
  }
}
