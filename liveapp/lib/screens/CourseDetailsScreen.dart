import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveapp/models/Content.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/models/Section.dart';
import 'package:video_player/video_player.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course course;
  CourseDetailsScreen(this.course);

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  final List<Section> _courseSections = [
    Section(id: 1, title: "Introduction to symfony", contents: [
      Content(
          id: 1,
          title:
              "Introduction2 to symfony and mastering symfony is less than 5 minutes",
          type: "video",
          hasAccess: true),
      Content(
          id: 2,
          title:
              "Introduction2 to react and mastering react is less than 15 minutes",
          type: "text",
          hasAccess: false),
      Content(
          id: 3,
          title:
              "Introduction2 to nodeJs and mastering nodeJs is less than 25 minutes",
          type: "audio",
          hasAccess: true),
      Content(
          id: 4,
          title:
              "Introduction2 to TypeScript and mastering TypeScript is less than 35 minutes",
          type: "video",
          hasAccess: false),
    ]),
    Section(id: 1, title: "Introduction to symfony", contents: [
      Content(
          id: 1,
          title:
              "Introduction2 to symfony and mastering symfony is less than 5 minutes",
          type: "video",
          hasAccess: true),
      Content(
          id: 2,
          title:
              "Introduction2 to react and mastering react is less than 15 minutes",
          type: "text",
          hasAccess: false),
      Content(
          id: 3,
          title:
              "Introduction2 to nodeJs and mastering nodeJs is less than 25 minutes",
          type: "audio",
          hasAccess: true),
      Content(
          id: 4,
          title:
              "Introduction2 to TypeScript and mastering TypeScript is less than 35 minutes",
          type: "video",
          hasAccess: false),
    ]),
    Section(
        id: 2,
        title: "Mastering react in just less than 5 minutes",
        contents: [
          Content(
              id: 1,
              title:
                  "Introduction3 to symfony and mastering symfony is less than 5 minutes",
              type: "video",
              hasAccess: true),
          Content(
              id: 2,
              title:
                  "Introduction3 to react and mastering react is less than 15 minutes",
              type: "text",
              hasAccess: false),
          Content(
              id: 3,
              title:
                  "Introduction3 to nodeJs and mastering nodeJs is less than 25 minutes",
              type: "audio",
              hasAccess: true),
          Content(
              id: 4,
              title:
                  "Introduction3 to TypeScript and mastering TypeScript is less than 35 minutes",
              type: "video",
              hasAccess: false),
        ]),
    Section(
        id: 3,
        title: "Mastering nodeJS in just less than 5 minutes",
        contents: [
          Content(
              id: 1,
              title:
                  "Introduction4 to symfony and mastering symfony is less than 5 minutes",
              type: "video",
              hasAccess: true),
          Content(
              id: 2,
              title:
                  "Introduction4 to react and mastering react is less than 15 minutes",
              type: "text",
              hasAccess: false),
          Content(
              id: 3,
              title:
                  "Introduction4 to nodeJs and mastering nodeJs is less than 25 minutes",
              type: "audio",
              hasAccess: true),
          Content(
              id: 4,
              title:
                  "Introduction4 to TypeScript and mastering TypeScript is less than 35 minutes",
              type: "video",
              hasAccess: false),
        ]),
    Section(
        id: 4,
        title: "Mastering TypeScript in just less than 5 minutes",
        contents: [
          Content(
              id: 1,
              title:
                  "Introduction5 to symfony and mastering symfony is less than 5 minutes",
              type: "video",
              hasAccess: true),
          Content(
              id: 2,
              title:
                  "Introduction5 to react and mastering react is less than 15 minutes",
              type: "text",
              hasAccess: false),
          Content(
              id: 3,
              title:
                  "Introduction5 to nodeJs and mastering nodeJs is less than 25 minutes",
              type: "audio",
              hasAccess: true),
          Content(
              id: 4,
              title:
                  "Introduction5 to TypeScript and mastering TypeScript is less than 35 minutes",
              type: "video",
              hasAccess: false),
        ]),
  ];

  ScrollController _scrollController;
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  bool hideTitle = false;
  String descText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  bool descTextShowFlag = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _videoPlayerController.initialize();

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset > 120 &&
          !_scrollController.position.outOfRange) {
        setState(() {
          hideTitle = true;
        });
      }
      if (_scrollController.offset <= 120 &&
          !_scrollController.position.outOfRange) {
        setState(() {
          hideTitle = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _videoPlayerController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: Colors.deepOrangeAccent,
        child: Center(
          child: Text(
            "Buy Now  @ (₹" + widget.course.price.toString() + ")",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown
          setState(() {
            // If the video is playing, pause it.
            if (_videoPlayerController.value.isPlaying) {
              _videoPlayerController.pause();
            } else {
              // If the video is paused, play it.
              _videoPlayerController.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xFFC96FF7),
            expandedHeight: 230,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.course.image,
                fit: BoxFit.cover,
              ),
              title: hideTitle
                  ? Text(" ")
                  : Text(
                      widget.course.title,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    ),
              titlePadding:
                  EdgeInsets.only(left: 10, right: 5, top: 1, bottom: 60),
            ),
            bottom: PreferredSize(
                child: hideTitle
                    ? Text(" ")
                    : Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Chip(
                              label: Text(
                                widget.course.author,
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                              avatar: CircleAvatar(
                                child: Icon(Icons.account_circle,
                                    color: Colors.black),
                                backgroundColor: Colors.white,
                              ),
                              backgroundColor: Color(0x00000000),
                              shadowColor: Color(0x00000000),
                              elevation: 10,
                            ),
                          ),
                          GestureDetector(
                            child: Chip(
                              label: Text("Development"),
                            ),
                            onTap: () {
                              _videoPlayerController.play();
                              print("Hello world start");
                              print(_videoPlayerController.value.aspectRatio);
                              print("Hello world end");
                            },
                          ),
                        ],
                      ),
                preferredSize: null),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, bottom: 0, right: 10),
                    child: Text(
                      "Preview",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            // If the VideoPlayerController has finished initialization, use
                            // the data it provides to limit the aspect ratio of the video.
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio:
                                    _videoPlayerController.value.aspectRatio,
                                // Use the VideoPlayer widget to display the video.
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: VideoPlayer(_videoPlayerController),
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
                      Center(
                        child: FloatingActionButton(
                          onPressed: () {
                            // Wrap the play or pause in a call to `setState`. This ensures the
                            // correct icon is shown
                            setState(() {
                              // If the video is playing, pause it.
                              if (_videoPlayerController.value.isPlaying) {
                                _videoPlayerController.pause();
                              } else {
                                // If the video is paused, play it.
                                _videoPlayerController.play();
                              }
                            });
                          },
                          // Display the correct icon depending on the state of the player.
                          child: Icon(
                            _videoPlayerController.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          descText,
                          maxLines: descTextShowFlag ? null : 8,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            descTextShowFlag = !descTextShowFlag;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            descTextShowFlag
                                ? Text(
                                    "Hide",
                                    style: TextStyle(color: Colors.blue),
                                  )
                                : Text("Read More",
                                    style: TextStyle(color: Colors.blue))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Curriculum",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 10,
                  child: ExpansionTile(
                    title: Text(_courseSections[index].title),
                    children: <Widget>[
                      Column(
                        children: _courseSections[index]
                            .contents
                            .map(
                              (e) => ListTile(
                                title: Text(e.title),
                                subtitle: Text(e.type),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: _courseSections.length),
          )
        ],
      ),
    );
  }
}
