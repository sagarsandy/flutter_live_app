import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CourseDetailsVideoWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final Chewie playerWidget;
  final Future initializeVideoPlayerFuture;

  CourseDetailsVideoWidget({
    Key key,
    this.videoPlayerController,
    this.playerWidget,
    this.initializeVideoPlayerFuture,
  }) : super(key: key);
  @override
  _CourseDetailsVideoWidgetState createState() =>
      _CourseDetailsVideoWidgetState();
}

class _CourseDetailsVideoWidgetState extends State<CourseDetailsVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 0, right: 10),
              child: Text(
                "Preview",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder(
              future: widget.initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: AspectRatio(
                      aspectRatio:
                          widget.videoPlayerController.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: widget.playerWidget,
                      ),
                    ),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
