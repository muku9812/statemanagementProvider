import 'package:flutter/material.dart';
import 'package:increment_prov/providesClass.dart';
import 'package:increment_prov/screens/darkTheme.dart';
import 'package:increment_prov/screens/favouriteScreen.dart';
import 'package:increment_prov/screens/stlessScreen.dart';
import 'package:provider/provider.dart';

class MultipleProvider extends StatefulWidget {
  const MultipleProvider({super.key});

  @override
  State<MultipleProvider> createState() => _MultipleProviderState();
}

class _MultipleProviderState extends State<MultipleProvider> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Provider'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ColorProvider>(builder: (context, valu, child) {
            return Slider(
                min: 0,
                max: 1,
                value: valu.values,
                onChanged: (value) {
                  valu.SetColor(value);
                });
          }),
          Consumer<ColorProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.values)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.values)),
                  ),
                ),
              ],
            );
          }),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => FavouriteScreen())));
            },
            child: Container(
              height: 50,
              width: 200,
              child: Center(child: Text('Favourite')),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => StlessScreen())));
            },
            child: Container(
              height: 50,
              width: 200,
              child: Center(child: Text('stless')),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      )),
    );
  }
}
