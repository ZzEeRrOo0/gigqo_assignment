import 'package:flutter/material.dart';

class TrackProvider extends ChangeNotifier {
  String _name = '';
  String _artist = '';
  String _year = '';
  String _cover = '';

  String get name => _name;
  String get artist => _artist;
  String get year => _year;
  String get cover => _cover;

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  setArtist(String artist) {
    _artist = artist;
    notifyListeners();
  }

  setYear(String year) {
    _year = year;
    notifyListeners();
  }

  setCover(String cover) {
    _cover = cover;
    notifyListeners();
  }

}