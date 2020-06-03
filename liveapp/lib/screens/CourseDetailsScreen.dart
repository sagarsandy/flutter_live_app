import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveapp/models/Author.dart';
import 'package:liveapp/models/Content.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/models/Section.dart';
import 'package:liveapp/screens/CurriculumScreen.dart';
import 'package:liveapp/screens/SearchResultsScreen.dart';
import 'package:liveapp/widgets/AuthorInfoWidget.dart';
import 'package:liveapp/widgets/ButtonWidgetOne.dart';
import 'package:liveapp/widgets/CourseDetailsCurriculumWidget.dart';
import 'package:liveapp/widgets/CourseDetailsSliverAppBar.dart';
import 'package:liveapp/widgets/CourseDetailsVideoWidget.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course course;
  CourseDetailsScreen(this.course);

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  void navigateToCurriculumScreen(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CurriculumScreen()));
  }

  void navigateToSearchResultsScreen(context, authorName) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SearchResultsScreen(authorName)));
  }

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
  ChewieController _chewieController;
  Chewie _playerWidget;
  Future<void> _initializeVideoPlayerFuture;
  bool hideTitle = false;
  bool descTextShowFlag = false;
  bool authorDescTextShowFlag = false;
  String courseDescription =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: true,
        looping: true);

    _playerWidget = Chewie(
      controller: _chewieController,
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
    _chewieController.dispose();

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
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          CourseDetailsSliverAppBar(
            course: widget.course,
            hideTitle: hideTitle,
          ),
          CourseDetailsVideoWidget(
            videoPlayerController: _videoPlayerController,
            playerWidget: _playerWidget,
            initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
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
                          courseDescription,
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
          CourseDetailsCurriculumWidget(_courseSections),
          SliverToBoxAdapter(
            child: ButtonWidgetOne(
              title: "View More Sections",
              onTap: () {
                navigateToCurriculumScreen(context);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 5, right: 5),
              child: Container(
                width: double.infinity,
                color: Colors.white24,
                child: GestureDetector(
                  onTap: () {
                    navigateToCurriculumScreen(context);
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AuthorInfoWidget(
                            Author(
                                id: 1,
                                name: "Sagar Sandy",
                                image:
                                    "https://s.gravatar.com/avatar/5334ee660503852bb5c2f4cb7240e366?s=80",
                                coursesCount: 4,
                                bio: "Binog"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "Bio:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 8.0),
                            child: Text(
                              courseDescription,
                              maxLines: authorDescTextShowFlag ? null : 8,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                authorDescTextShowFlag =
                                    !authorDescTextShowFlag;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                authorDescTextShowFlag
                                    ? Text(
                                        "Hide",
                                        style: TextStyle(color: Colors.blue),
                                      )
                                    : Text("Read More",
                                        style: TextStyle(color: Colors.blue))
                              ],
                            ),
                          ),
                          ButtonWidgetOne(
                            title: "View Courses",
                            onTap: () {
                              navigateToSearchResultsScreen(
                                  context, "Sagar Sandy");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
