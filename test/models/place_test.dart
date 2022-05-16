import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:purple_places/models/place.dart';

void main() {
  group('unit tests to place.dart - ', () {
    test('toLatLng function returns a 100 100 LatLng given doubles', () {
      final placeLocation = PlaceLocation(
        latitude: 100,
        longitude: 100,
      );
      final place = placeLocation.toLatLng();

      expect(place, isA<LatLng>());
      expect(place, LatLng(100, 100));
    });
  });
}
