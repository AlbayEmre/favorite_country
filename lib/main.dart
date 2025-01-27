import 'package:favorite_country/Favorite_Cuntry/label_view.dart';
import 'package:favorite_country/Global/Resource_Context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
void main() {
  runApp(MainApp());
}
*/

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      //  ChangeNotifierProvider(create: create)
      //  ChangeNotifierProvider(create: create)   ->Buraya tema da yazilabilinir temenın deyişeceği provider
    ],
    builder: (context, child) => const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Label_View(),
    );
  }
}
