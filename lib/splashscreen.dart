import 'dart:async';
import 'dart:ui' as prefix0;

import 'package:firestore_example/gridview_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => GridViewExample())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/splash_image.jpg'),
              ),
            ),
            child: BackdropFilter(
              filter: prefix0.ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0
              ),
              child: Center(
                child: Text(
                  'Beautiful Walls',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontFamily: 'Stylish',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
