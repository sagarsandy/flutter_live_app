import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/screens/CourseDetailsScreen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseBlockFourWidget extends StatelessWidget {
  final Course course;
  CourseBlockFourWidget(this.course);

  void navigateToCourseDetailsScreen(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CourseDetailsScreen(course)));

//    Navigator.pushReplacement(
//      context,
//      MaterialPageRoute(
//        builder: (context) => CourseDetailsScreen(course),
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          navigateToCourseDetailsScreen(context);
        },
        child: Card(
          elevation: 20,
          borderOnForeground: true,
          child: Container(
            width: double.infinity,
            height: 110,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Image.network(
                    course.image,
                    fit: BoxFit.fitHeight,
                    height: 100,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, top: 3, right: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Text(
                              course.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  course.author + "Bingo long title",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 1, top: 10),
                                  child: LinearPercentIndicator(
                                    animation: true,
                                    lineHeight: 15.0,
                                    animationDuration: 2000,
                                    percent: 0.9,
                                    center: Text("90%"),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: Color(0xFFC96FF7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
