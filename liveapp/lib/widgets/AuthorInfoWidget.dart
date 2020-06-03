import 'package:flutter/material.dart';
import 'package:liveapp/models/Author.dart';

class AuthorInfoWidget extends StatelessWidget {
  final Author author;

  AuthorInfoWidget(this.author);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(author.image),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Author:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                author.name,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                author.coursesCount.toString() + " Courses",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
