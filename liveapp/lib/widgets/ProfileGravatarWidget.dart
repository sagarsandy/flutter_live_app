import 'package:flutter/material.dart';

class ProfileGravatarWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;

  ProfileGravatarWidget({
    Key key,
    this.imageUrl,
    this.name,
    this.email,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 10),
      child: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
