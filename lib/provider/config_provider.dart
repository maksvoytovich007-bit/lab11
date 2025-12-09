import 'package:flutter/material.dart';

class ConfigModel with ChangeNotifier {

  double _width = 100.0;
  double _height = 100.0;
  double _radius = 0.0;

  double get width => _width;
  double get height => _height;
  double get radius => _radius;


  void setWidth(double newWidth) {
    _width = newWidth;
    notifyListeners();
  }

  void setHeight(double newHeight) {
    _height = newHeight;
    notifyListeners();
  }

  void setRadius(double newRadius) {
    _radius = newRadius;
    notifyListeners();
  }
}