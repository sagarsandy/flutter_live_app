import 'package:flutter/material.dart';

class HomePageTitlePadding extends StatelessWidget {
  final String title;
  final double verticalPadding;
  final Function onTap;
  HomePageTitlePadding({Key key, this.title, this.verticalPadding, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF010a43),
                ),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
