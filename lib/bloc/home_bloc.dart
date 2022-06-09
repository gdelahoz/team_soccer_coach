import 'package:flutter/material.dart';

class HomeBLoC extends ChangeNotifier {
  HomeBLoC() : super();

  int indexSelected = 0;
  String firstText = "";
  String secondText = "";

  void updateIndexSelected(int index) {
    indexSelected = index;
    updateText();
    notifyListeners();
  }

  void updateText() {
    switch (indexSelected) {
      case 0:
        firstText = "Bienvenido";
        secondText = "";
        break;
      case 1:
        firstText = "Eventos";
        secondText = "Importantes";
        break;
      case 2:
        firstText = "Nuestro";
        secondText = "Equipo";
        break;
      default:
    }
  }
}
