import 'package:flutter/material.dart';

class SignOutWidget extends StatelessWidget {
  final Function tappedSignOutButton;

  SignOutWidget({Key key, this.tappedSignOutButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Card(
        elevation: 10,
        child: GestureDetector(
          onTap: tappedSignOutButton,
          child: Container(
            width: double.infinity,
            height: 60,
            child: Center(
              child: Text(
                "Signout",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
