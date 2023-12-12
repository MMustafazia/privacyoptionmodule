import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privacyoption/screen/player/playerview.dart';

class SelectVideo extends StatefulWidget {
  const SelectVideo({super.key});

  @override
  State<SelectVideo> createState() => _SelectVideoState();
}

class _SelectVideoState extends State<SelectVideo> {
  File? _file;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () async {
              final file =
                  await ImagePicker().pickVideo(source: ImageSource.gallery);
              if (file != null) {
                setState(() {
                  _file = File(file.path);
                });
              }
            },
            child: Text("Select video")),
        if (_file != null)
          VideoPlayerView(url: _file!.path, dataSourceType: DataSourceType.file)
      ],
    );
  }
}
