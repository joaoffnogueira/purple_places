import 'dart:io';

import 'package:flutter/material.dart';
import 'package:purple_places/models/place.dart';
import 'package:purple_places/utils/db_utils.dart';

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
    DbUtils.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address ?? '',
    });
    notifyListeners();
  }
}
