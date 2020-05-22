import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/widgets/CourseDetailsCoverWidget.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Course course;
  CourseDetailsScreen(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            CourseDetailsCoverWidget(course),
          ],
        ),
      ),
    );
  }
}
