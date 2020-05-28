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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Wrap(
                                      children: <Widget>[
//                                      Icon(
//                                        Icons.star,
//                                        color: Color(0xFFC96FF7),
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Color(0xFFC96FF7),
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Color(0xFFC96FF7),
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Color(0xFFC96FF7),
//                                      ),
//                                      Icon(
//                                        Icons.star,
//                                        color: Colors.purple.shade50,
//                                      ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        "\$" + course.price.toString(),
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ),
                                  ],
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
