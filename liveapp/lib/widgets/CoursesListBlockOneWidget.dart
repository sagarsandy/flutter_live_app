import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/widgets/CourseBlockOneWidget.dart';

class CoursesListBlockOneWidget extends StatelessWidget {
  final List<Course> coursesList;

  CoursesListBlockOneWidget(this.coursesList);

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.grey,
      height: 240,
      child: coursesList.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Fetching courses...',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Image.network(
                    '',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return CourseBlockOneWidget(coursesList[index]);
              },
              itemCount: coursesList.length,
              scrollDirection: Axis.horizontal,
            ),
    );
  }
}
