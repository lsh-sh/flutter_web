import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('首页'),
        ),
      ),
    );
  }
}
