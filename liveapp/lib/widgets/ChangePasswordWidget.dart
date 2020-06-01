import 'package:flutter/material.dart';

class ChangePasswordWidget extends StatelessWidget {
  final GlobalKey<FormState> passwordFormKey;
  final Function validateCurrentPassword;
  final Function validateNewPassword;
  final Function validateConfirmPassword;
  final Function validateChangePasswordForm;

  ChangePasswordWidget(
      {Key key,
      this.passwordFormKey,
      this.validateCurrentPassword,
      this.validateNewPassword,
      this.validateConfirmPassword,
      this.validateChangePasswordForm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        elevation: 10,
        child: ExpansionTile(
          title: Text(
            "Change Password",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade300),
          ),
          children: <Widget>[
            Form(
              key: passwordFormKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Current Password',
                          ),
                          validator: validateCurrentPassword,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20, right: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                          ),
                          validator: validateNewPassword,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20, right: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                          ),
                          validator: validateConfirmPassword,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: RaisedButton(
                          color: Color(0xFFC96FF7),
                          textColor: Colors.white,
                          onPressed: validateChangePasswordForm,
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
