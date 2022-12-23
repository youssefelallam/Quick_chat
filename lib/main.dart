import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_msg/controller/data_controller.dart';
import 'package:quick_msg/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataController(),
      child: MaterialApp(
        title: 'Quick MSG',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
        ),
        home: const HomePage(),
      ),
    );
  }
}
