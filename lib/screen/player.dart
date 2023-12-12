import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privacyoption/screen/player/playerview.dart';
import 'package:privacyoption/screen/player/selectvideo.dart';
import 'package:video_player/video_player.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("player"),
        actions: [Image.asset("assets/canada1.png")],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          VideoPlayerView(
            url: "assets/f.mp4",
            dataSourceType: DataSourceType.asset,
          ),
          SizedBox(
            height: 24,
          ),
          VideoPlayerView(
            url:
                "https://vod-progressive.akamaized.net/exp=1701103375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4060%2F12%2F320304435%2F1241959326.mp4~hmac=3f4c5497e4230c982e2ea32e877af4ae5a03a8208d97d13ad57f011b6673040e/vimeo-prod-skyfire-std-us/01/4060/12/320304435/1241959326.mp4",
            dataSourceType: DataSourceType.network,
          ),
          SizedBox(
            height: 24,
          ),
          SelectVideo(),
        ],
      ),
    );
  }
}

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView(
      {super.key, required this.url, required this.dataSourceType});
  final String url;
  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.network(widget.url);
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
    }
    _chewieController = ChewieController(
        autoPlay: true,
        showControls: true,
        showOptions: true,
        showControlsOnInitialize: true,
        allowFullScreen: true,
        systemOverlaysAfterFullScreen: List.empty(),
        deviceOrientationsAfterFullScreen: List.empty(),
        playbackSpeeds: List.empty(),
        startAt: Duration(seconds: 4),
        systemOverlaysOnEnterFullScreen: List.empty(),
        deviceOrientationsOnEnterFullScreen: List.empty(),
        allowMuting: true,
        fullScreenByDefault: false,
        looping: true,
        videoPlayerController: _videoPlayerController,
        aspectRatio: 16 / 9);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.dataSourceType.name.toUpperCase(),
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Divider(),
      // _videoPlayerController.value.isInitialized
      //     ?
      AspectRatio(
        aspectRatio: 16 / 9,
        // aspectRatio: _videoPlayerController.value.aspectRatio,
        child: Chewie(controller: _chewieController),
      )
      // : SizedBox.shrink(),
    ]);
  }
}

enum DataSourceType {
  asset,
  network,
  file,
  contentUri,
}

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
