import 'package:flutter/material.dart';
import 'package:increment_prov/providesClass.dart';
import 'package:increment_prov/screens/selectedFavourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectedFavourite()));
              },
              child: Icon(Icons.favorite_sharp))
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                    builder: (context, item, child) {
                  return ListTile(
                    onTap: () {
                      if (!item.favouriteList.contains(index)) {
                        item.addValue(index);
                      } else {
                        item.removeValue(index);
                      }
                    },
                    title: Text('Index ' + index.toString()),
                    trailing: Icon(item.favouriteList.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_outline),
                  );
                });
              }),
        )
      ]),
    );
  }
}
