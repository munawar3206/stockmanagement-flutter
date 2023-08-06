import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


import 'package:stock/Screens/splash.dart';


import 'model/stock.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StockAdapter());
  await Hive.openBox<Stock>('stockbox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),
    );
  }
}
