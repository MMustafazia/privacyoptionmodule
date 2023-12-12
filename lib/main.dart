import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:privacyoption/hive/hive1.dart';
import 'package:privacyoption/hive/hiveexp.dart';
import 'package:privacyoption/privacygallery/home.dart';
import 'package:privacyoption/privacygallery/pgalleryhome.dart';
import 'package:privacyoption/privacygallery/pgallerylock.dart';
import 'package:privacyoption/privacygallery/splash.dart';
import 'package:privacyoption/privacygallery/uploader.dart';
import 'package:privacyoption/screen/homescreen.dart';
import 'package:privacyoption/screen/player.dart';
import 'package:privacyoption/screen/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseStorage.instance.ref('/files').listAll();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen2(),
    );
  }
}
