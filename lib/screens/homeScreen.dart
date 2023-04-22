import 'dart:async';

import 'package:flutter/material.dart';
import 'package:increment_prov/providesClass.dart';
import 'package:increment_prov/screens/darkTheme.dart';
import 'package:increment_prov/screens/multiProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      counterProvider.Setcount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DarkThemeScreen()));
              },
              child: Icon(Icons.sunny)),
          SizedBox(
            width: 10,
          )
        ],
        title: Text('Providers'),
        centerTitle: true,
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 25),
              ),
              Text(
                '${value.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MultipleProvider()));
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Center(child: Text('Multiple prov')),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.Setcount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
