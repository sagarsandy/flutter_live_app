import 'package:flutter/material.dart';

class FormInputWidget extends StatelessWidget {
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final String labelText;
  final String errorMessage;
  final Function onValidate;

  const FormInputWidget(
      {Key key,
      this.leftPadding,
      this.rightPadding,
      this.topPadding,
      this.bottomPadding,
      this.labelText,
      this.errorMessage,
      this.onValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding,
          right: rightPadding,
          top: topPadding,
          bottom: bottomPadding),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: onValidate,
      ),
    );
  }
}
