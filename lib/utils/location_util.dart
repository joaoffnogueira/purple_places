import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:purple_places/utils/keys.dart';
import 'package:http/http.dart' as http;

class LocationUtil {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=12&size=400x400&markers=color:blue%7Clabel:%7C$latitude,$longitude&key=${Keys.mapsApiKey}';
  }

  static Future<String> getAddressFromLatLng(
    LatLng latLng,
  ) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=${Keys.mapsApiKey}';
    final response = await http.get(Uri.parse(url));
    final decodedResponse = jsonDecode(response.body);
    final formattedAddress = decodedResponse['results'][0]['formatted_address'];
    return formattedAddress;
  }
}
