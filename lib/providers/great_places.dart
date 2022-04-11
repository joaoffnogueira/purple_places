import 'dart:io';

import 'package:flutter/material.dart';
import 'package:purple_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  Place findByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: 0,
        longitude: 0,
      ),
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
