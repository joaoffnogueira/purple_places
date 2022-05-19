import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purple_places/providers/great_places.dart';
import 'package:purple_places/screens/place_detail_screen.dart';
import 'package:purple_places/screens/place_form_screen.dart';
import 'package:purple_places/screens/places_list_screen.dart';
import 'package:purple_places/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GreatPlaces(),
      child: MaterialApp(
        title: 'Purple Places',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple, 
        ),
        home: PlacesListScreen(),
        routes: {
          AppRoutes.placeForm: (ctx) => PlaceFormScreen(),
          AppRoutes.placeDetail: (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
