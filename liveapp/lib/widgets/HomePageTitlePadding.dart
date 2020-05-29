import 'package:flutter/material.dart';

class HomePageTitlePadding extends StatelessWidget {
  final String title;
  final double verticalPadding;
  HomePageTitlePadding(this.title, this.verticalPadding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0XFF010a43),
          ),
        ),
      ),
    );
  }
}
