import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/great_places.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        // Neu khong co j thay doi thi return child, child la cai khong thay doi
        child: Center(
          child: Text('Got no places yet, start to adding some'),
        ),
        builder: (context, greatPlaces, ch) => greatPlaces.items.length < 0
            ? ch
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                        greatPlaces.items[i].image,
                      ),
                    ),
                    title: Text(greatPlaces.items[i].title),
                    onTap: () {
                      // Go To detail place
                    }),
              ),
      ),
    );
  }
}
