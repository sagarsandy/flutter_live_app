import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final GlobalKey<FormState> forgotPasswordFormKey;
  final Function validateEmail;
  final Function validateForgotPasswordForm;
  final Function tappedSignInButton;

  ForgotPasswordWidget(
      {Key key,
      this.forgotPasswordFormKey,
      this.validateEmail,
      this.validateForgotPasswordForm,
      this.tappedSignInButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgotPasswordFormKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 10,
            child: Container(
              color: Colors.cyan.withAlpha(10),
              width: double.infinity,
              height: 250,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFC96FF7),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      validator: validateEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: RaisedButton(
                      color: Color(0xFFC96FF7),
                      textColor: Colors.white,
                      onPressed: validateForgotPasswordForm,
                      child: Text('Forgot Password'),
                    ),
                  ),
                  GestureDetector(
                    child: Text("Back to Login",
                        style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            color: Color(0xFFC96FF7))),
                    onTap: tappedSignInButton,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
