import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/screens/CourseDetailsScreen.dart';

class CourseBlockOneWidget extends StatelessWidget {
  final Course course;
  CourseBlockOneWidget(this.course);

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
    return Row(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 3, right: 25, top: 0, bottom: 25),
          child: Container(
            width: 230,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                navigateToCourseDetailsScreen(context);
              },
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: Image.network(course.image,
                        width: 230, height: 120, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Text(
                      course.title,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0XFF010a43),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 5, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            course.author,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Color(0XFF010a43),
                                fontStyle: FontStyle.italic),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                          width: 140,
                          height: 25,
                        ),
                        Text(
                          "\$" + course.price.toString(),
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color(0XFF010a43),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
