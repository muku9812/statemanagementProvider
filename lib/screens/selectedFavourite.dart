import 'package:flutter/material.dart';
import 'package:increment_prov/providesClass.dart';
import 'package:provider/provider.dart';

class SelectedFavourite extends StatefulWidget {
  const SelectedFavourite({super.key});

  @override
  State<SelectedFavourite> createState() => _SelectedFavouriteState();
}

class _SelectedFavouriteState extends State<SelectedFavourite> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Favourite'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: favouriteProvider.favouriteList.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                    builder: (context, item, child) {
                  return ListTile(
                    onTap: () {
                      if (item.favouriteList.contains(index)) {
                        favouriteProvider.removeValue(index);
                      } else {
                        favouriteProvider.addValue(index);
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
