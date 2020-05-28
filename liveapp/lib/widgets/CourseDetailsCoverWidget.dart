import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/widgets/BackButtonWidget.dart';

class CourseDetailsCoverWidget extends StatelessWidget {
  final Course course;
  CourseDetailsCoverWidget(this.course);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            course.image,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackButtonWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              course.title + " " + course.title,
              maxLines: 4,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3, right: 5),
            child: Container(
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                children: <Widget>[
                  Chip(
                    label: Text(
                      course.author,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    avatar: CircleAvatar(
                      child: Icon(Icons.account_circle, color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                    backgroundColor: Color(0x00000000),
                    shadowColor: Color(0x00000000),
                    elevation: 10,
                  ),
                  Chip(label: Text("Development")),
                  Chip(label: Text("Docker")),
                  Chip(label: Text("Containers")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
