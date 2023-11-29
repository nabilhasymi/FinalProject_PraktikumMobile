import 'package:flutter/material.dart';
import 'package:ebook_shop/Pages/HalamanLogin.dart';
import 'package:hive_flutter/adapters.dart';
import 'Model/RequestBukuModel.dart';

String boxName = "Request Box";

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<RequestBuku>(RequestBukuAdapter());
  await Hive.openBox<RequestBuku>(boxName);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanLogin(),
    );
  }
}
