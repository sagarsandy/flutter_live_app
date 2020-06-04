import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/widgets/CourseBlockTwoWidget.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CoursesListBlockTwoWidget extends StatelessWidget {
  final List<Course> coursesList;

  CoursesListBlockTwoWidget(this.coursesList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: coursesList.isEmpty
          ? Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 200,
                    child: ScalingText(
                      "Loading..",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return CourseBlockTwoWidget(coursesList[index]);
              },
              itemCount: coursesList.length,
              scrollDirection: Axis.horizontal,
            ),
    );
  }
}
