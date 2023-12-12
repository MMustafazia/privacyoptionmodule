import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:privacyoption/privacygallery/pgalleryhome.dart';

class Uploader extends StatefulWidget {
  const Uploader({super.key});

  @override
  State<Uploader> createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'uploaded/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print("Downloadable Link : ${urlDownload}");
    setState(() {
      pickedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uploader"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PGalleryHomeScreen()));
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          children: [
            if (pickedFile != null)
              Expanded(
                  child: Container(
                child: Center(
                  child: Text(pickedFile!.name),
                ),
                color: Colors.blue[100],
              )),
            ElevatedButton(onPressed: selectFile, child: Text("Select File")),
            ElevatedButton(onPressed: uploadFile, child: Text("Upload File")),
          ],
        ),
      ),
    );
  }
}
