import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:privacyoption/privacygallery/home.dart';
import 'package:privacyoption/privacygallery/uploader.dart';

class PGalleryHomeScreen extends StatefulWidget {
  const PGalleryHomeScreen({super.key});

  @override
  State<PGalleryHomeScreen> createState() => _PGalleryHomeScreenState();
}

class _PGalleryHomeScreenState extends State<PGalleryHomeScreen> {
  // late Future<ListResult> futureFiles;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   futureFiles = FirebaseStorage.instance.ref('files/').list();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Privacy gallery Home"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Uploader()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      // body: Scaffold(),
      // FutureBuilder<ListResult>(
      //   future: futureFiles,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       final files = snapshot.data!.items;
      //       return ListView.builder(
      //         itemCount: files.length,
      //         itemBuilder: (context, index) {
      //           final file = files[index];
      //           return ListTile(
      //             title: Text(file.name),
      //             trailing: IconButton(
      //                 onPressed: () {
      //                   downloadFile(file);
      //                 },
      //                 icon: Icon(Icons.download)),
      //           );
      //         },
      //       );
      //     } else if (snapshot.hasError) {
      //       return const Center(
      //         child: Text("error occured"),
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }

  // Future downloadFile(Reference ref) async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/${ref.name}');
  //   await ref.writeToFile(file);

  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text("File Downloaded: ${ref.name}")));
  // }
}
