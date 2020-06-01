import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  final GlobalKey<FormState> signUpFormKey;
  final Function validateName;
  final Function validateEmail;
  final Function validatePassword;
  final Function validateSignUpForm;
  final Function tappedSignInButton;

  SignUpWidget(
      {Key key,
      this.signUpFormKey,
      this.validateName,
      this.validateEmail,
      this.validatePassword,
      this.validateSignUpForm,
      this.tappedSignInButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpFormKey,
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
              height: 350,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                      validator: validateName,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: validateEmail,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      onPressed: validateSignUpForm,
                      child: Text('SignUp'),
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
