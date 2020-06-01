import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey;
  final Function validateEmail;
  final Function validatePassword;
  final Function validateSignInForm;
  final Function tappedForgotPasswordButton;
  final Function tappedSignUpButton;

  SignInWidget(
      {Key key,
      this.loginFormKey,
      this.validateEmail,
      this.validatePassword,
      this.validateSignInForm,
      this.tappedForgotPasswordButton,
      this.tappedSignUpButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 10,
            child: Container(
              width: double.infinity,
              color: Colors.cyan.withAlpha(10),
              height: 290,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: validateEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: validatePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: RaisedButton(
                      color: Color(0xFFC96FF7),
                      textColor: Colors.white,
                      onPressed: validateSignInForm,
                      child: Text('SignIn'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          child: Text("Forgot Password?",
                              style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFFC96FF7))),
                          onTap: tappedForgotPasswordButton,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          child: Text("SignUp",
                              style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFFC96FF7))),
                          onTap: tappedSignUpButton,
                        ),
                      )
                    ],
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
