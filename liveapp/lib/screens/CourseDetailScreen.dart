import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liveapp/models/Content.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/models/Section.dart';
import 'package:liveapp/screens/CurriculumScreen.dart';
import 'package:liveapp/widgets/CourseDetailsCoverWidget.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;
  CourseDetailScreen(this.course);

  void navigateToCurriculumScreen(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CurriculumScreen()));
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        height: 60,
        color: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.cyan.withAlpha(10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CourseDetailsCoverWidget(course),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 15),
                child: Text(
                  "Curriculum",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 280,
//                color: Colors.blueGrey,
                child: ListView.builder(
                  padding: EdgeInsets.all(2),
                  itemCount: _courseSections.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 10,
                      child: ExpansionTile(
                        title: Text(_courseSections[i].title),
                        children: <Widget>[
                          Column(
                            children: _courseSections[i]
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
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    navigateToCurriculumScreen(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    child: Card(
                      elevation: 20,
                      child: Align(
                        child: Text(
                          "More Sections",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}