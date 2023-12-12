import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privacyoption/privacygallery/home.dart';
import 'package:privacyoption/screen/home3.dart';
import 'package:privacyoption/screen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:go_global/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String LOGINKEY = "login";
  @override
  void initState() {
    super.initState();
    whereToGO();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade900),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.screen_lock_portrait_sharp,
                size: 50,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                "Privacy Gallery",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void whereToGO() async {
    var sharepref = await SharedPreferences.getInstance();
    var isLoggedIn = sharepref.getBool(LOGINKEY);

    Timer(Duration(seconds: 5), () {
      if (isLoggedIn != null) {
        if (isLoggedIn == true) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home3(),
              ));
        } else if (isLoggedIn == false) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else {
          print("error");
        }
        ;
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      }
    });
  }
}
