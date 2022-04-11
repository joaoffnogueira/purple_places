import 'dart:io';

import 'package:flutter/material.dart';
import 'package:purple_places/models/place.dart';
import 'package:purple_places/utils/db_utils.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtils.getData('places');
    _items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: PlaceLocation(
                latitude: item['loc_lat'],
                longitude: item['loc_lng'],
                address: item['address'],
              ),
            ))
        .toList();
    notifyListeners();
  }

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
