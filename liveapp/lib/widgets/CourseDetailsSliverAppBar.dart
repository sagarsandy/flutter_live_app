import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';

class CourseDetailsSliverAppBar extends StatefulWidget {
  final Course course;
  final bool hideTitle;

  CourseDetailsSliverAppBar({
    Key key,
    this.course,
    this.hideTitle,
  }) : super(key: key);

  @override
  _CourseDetailsSliverAppBarState createState() =>
      _CourseDetailsSliverAppBarState();
}

class _CourseDetailsSliverAppBarState extends State<CourseDetailsSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xFFC96FF7),
      expandedHeight: 230,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          widget.course.image,
          fit: BoxFit.cover,
        ),
        title: widget.hideTitle
            ? Text(" ")
            : Text(
                widget.course.title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              ),
        titlePadding: EdgeInsets.only(left: 10, right: 5, top: 1, bottom: 60),
      ),
      bottom: PreferredSize(
          child: widget.hideTitle
              ? Text(" ")
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Chip(
                        label: Text(
                          widget.course.author,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        avatar: CircleAvatar(
                          child:
                              Icon(Icons.account_circle, color: Colors.black),
                          backgroundColor: Colors.white,
                        ),
                        backgroundColor: Color(0x00000000),
                        shadowColor: Color(0x00000000),
                        elevation: 10,
                      ),
                    ),
                    Chip(
                      label: Text("Development"),
                    ),
                  ],
                ),
          preferredSize: null),
    );
  }
}
