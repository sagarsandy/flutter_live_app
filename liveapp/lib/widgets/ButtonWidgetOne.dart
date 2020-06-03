import 'package:flutter/material.dart';

class ButtonWidgetOne extends StatelessWidget {
  final String title;
  final Function onTap;

  ButtonWidgetOne({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: Container(
        width: double.infinity,
        height: 60,
        color: Colors.white24,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 10,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
