import 'package:flutter/cupertino.dart';

import '../utilities.dart';

class DonutBarSelectionService extends ChangeNotifier {
  String? tabSelection;
  void setTabSelection(String value) {
    Utils.mainListnav.currentState!.pushReplacementNamed('/' + value);
    tabSelection = value;
    notifyListeners();
  }
}
