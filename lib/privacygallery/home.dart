import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:privacyoption/privacygallery/login.dart';
import 'package:privacyoption/privacygallery/pgallerylock.dart';
import 'package:privacyoption/screen/changepasswordcheck.dart';
import 'package:privacyoption/screen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("privacy Gallery home"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut().then(
                  (value) async {
                    try {
                      await FirebaseAuth.instance.signOut();

                      // If the log out is successful, show a toast message
                      Fluttertoast.showToast(
                        msg: "Logged out",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                      var pref = await SharedPreferences.getInstance();
                      pref.setString("email", "null");
                      pref.setString("password", "null");
                      var spref = await SharedPreferences.getInstance();
                      var emaillogout = spref.getString("email");
                      var passwordlogout = spref.getString("password");
                      print("after logout email = $emaillogout");
                      print("after logout password = $passwordlogout");
                      print("logged out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LockScreen()));
                    } catch (e) {
                      // Handle logout errors
                      print("Logout failed: $e");
                    }
                  },
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PGalleryLockScreen()));
                },
                child: Text("Enter privacy gallery")),
          )
        ],
      ),
    );
  }
}
