import 'package:flutter/material.dart';
import 'package:increment_prov/providesClass.dart';
import 'package:increment_prov/screens/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeColorProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeColorProvider>(context);
        return MaterialApp(
          themeMode: themeChanger.themeMode,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.cyan,
            primaryColor: Colors.yellowAccent,
            iconTheme: IconThemeData(color: Colors.white),
            appBarTheme: AppBarTheme(backgroundColor: Colors.black54),
          ),
          home: const HomeScreen(),
        );
      }),
    );
  }
}
