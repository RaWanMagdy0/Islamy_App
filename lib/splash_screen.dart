import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class splash_screen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), navigateloginpage);
  }

  void navigateloginpage() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(provider.theme == ThemeMode.light
                  ? 'assets/images/splash.png'
                  : 'assets/images/dark_back.png'),
              fit: BoxFit.contain,
            ),
          ),
        ));
  }
}
