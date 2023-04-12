import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.zoom,
      initialRoute: AppPages.inital,
      getPages: AppPages.routes,
    );
  }
}
