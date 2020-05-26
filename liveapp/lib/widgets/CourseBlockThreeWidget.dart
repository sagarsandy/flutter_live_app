import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/screens/CourseDetailsScreen.dart';

class CourseBlockThreeWidget extends StatelessWidget {
  final Course course;
  CourseBlockThreeWidget(this.course);

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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Container(
          width: double.infinity,
          height: 130,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image.network(
                  course.image,
                  fit: BoxFit.fill,
                  height: 130,
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, top: 3, right: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
//                          height: 124,
                          child: Text(
                            course.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              course.author + "Bingo long title",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              "\$" + course.price.toString(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
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
    );
  }
}
