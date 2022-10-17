import 'dart:async';
import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'HomePage.dart';


class VideoScreenPage extends StatefulWidget {
  const VideoScreenPage({Key? key,required this.videos}) : super(key: key);
  final Videos videos;
  @override
  State<VideoScreenPage> createState() => _VideoScreenPageState();
}

class _VideoScreenPageState extends State<VideoScreenPage> {
  late VideoPlayerController videoPlayerController;
  late VideoPlayerController video2PlayerController;
  late ChewieController chewieController;
  late ChewieController chewie2Controller;
  List networkVideos = [];
  @override
  initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });

    videoPlayerController = VideoPlayerController.asset(
      widget.videos.video.toString(),
    );

    videoPlayerController.initialize().then((val) {
      setState(() {});
    });

    chewieController =
        ChewieController(videoPlayerController: videoPlayerController);
    (chewieController.isPlaying)
        ? Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    })
        : null;

    video2PlayerController = VideoPlayerController.asset(
      widget.videos.video2,
    );

    video2PlayerController.initialize().then((val) {
      setState(() {});
    });

    chewie2Controller =
        ChewieController(videoPlayerController: video2PlayerController);
    (chewie2Controller.isPlaying)
        ? Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    })
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: Text(

          widget.videos.categories,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 7,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              height: 200,
              width: double.infinity,
              color: Colors.black,
              child: AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              height: 200,
              width: double.infinity,
              color: Colors.black,
              child: AspectRatio(
                aspectRatio: video2PlayerController.value.aspectRatio,
                child: Chewie(
                  controller: chewie2Controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
