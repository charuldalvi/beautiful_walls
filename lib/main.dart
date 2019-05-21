
import 'package:firestore_example/splashscreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(HomPage());
}

class HomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firestore Example',
      home: SplashScreen(),
    );
  }
}


