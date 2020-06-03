import 'package:flutter/material.dart';
import 'package:liveapp/models/Content.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/models/Section.dart';
import 'package:liveapp/screens/CourseDetailsScreen.dart';

class CurriculumScreen extends StatelessWidget {
  final bool showInfoButton;
  final Course course;

  CurriculumScreen(this.showInfoButton, this.course);

  void navigateToCourseDetailsScreen(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CourseDetailsScreen(course)));
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curriculum"),
        backgroundColor: Color(0xFFC96FF7),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: showInfoButton
                ? IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      navigateToCourseDetailsScreen(context);
                    },
                  )
                : null,
          )
        ],
      ),
      body: Container(
        color: Colors.cyan.withAlpha(10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 10,
                child: ExpansionTile(
                  title: Text(_courseSections[index].title),
//                initiallyExpanded: true,
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
          },
          itemCount: _courseSections.length,
        ),
      ),
    );
  }
}
