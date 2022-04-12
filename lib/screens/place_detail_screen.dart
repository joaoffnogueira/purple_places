import 'package:flutter/material.dart';
import 'package:purple_places/models/place.dart';
import 'package:purple_places/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)?.settings.arguments as Place;
    return Scaffold(
        appBar: AppBar(
          title: Text(place.title),
        ),
        body: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.file(
                place.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 10),
            Text(
              place.location.address ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            TextButton.icon(
              label: Text('Ver no mapa'),
              icon: Icon(Icons.map),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => MapScreen(
                      initialLocation: place.location,
                      isReadOnly: true,
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
