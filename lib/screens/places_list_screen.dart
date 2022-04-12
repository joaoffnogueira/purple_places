import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purple_places/providers/great_places.dart';
import 'package:purple_places/utils/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purple Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('Nenhum local cadastrado.'),
                ),
                builder: (ctx, greatPlaces, child) => greatPlaces.itemsCount ==
                        0
                    ? child!
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (_, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.items[index].image),
                          ),
                          title: Text(greatPlaces.items[index].title),
                          subtitle: Text(
                              greatPlaces.items[index].location.address ?? ''),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.placeDetail,
                              arguments: greatPlaces.items[index],
                            );
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
