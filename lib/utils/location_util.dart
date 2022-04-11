import 'package:purple_places/utils/keys.dart';

class LocationUtil {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=12&size=400x400&markers=color:blue%7Clabel:%7C$latitude,$longitude&key=${Keys.mapsApiKey}';
  }
}
