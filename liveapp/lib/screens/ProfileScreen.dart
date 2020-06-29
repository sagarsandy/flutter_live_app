import 'package:flutter/material.dart';
import 'package:liveapp/models/Transaction.dart';
import 'package:liveapp/widgets/ChangePasswordWidget.dart';
import 'package:liveapp/widgets/ForgotPasswordWidget.dart';
import 'package:liveapp/widgets/OrderHistoryWidget.dart';
import 'package:liveapp/widgets/ProfileGravatarWidget.dart';
import 'package:liveapp/widgets/SignInWidget.dart';
import 'package:liveapp/widgets/SignOutWidget.dart';
import 'package:liveapp/widgets/SignUpWidget.dart';
import 'package:liveapp/widgets/UpdateProfileWidget.dart';

class ProfileScreen extends StatefulWidget {
  bool isUserLoggedIn;
  final List<Transaction> userTransactions;
  ProfileScreen({
    Key key,
    this.isUserLoggedIn,
    this.userTransactions,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();
  final _profileFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  int _profileStackWidgetIndex = 3;

  final List<Transaction> _transactions = [
    Transaction(
        id: 1,
        title: "Mastering photography in 30 days",
        receipt: "akjshdkj12h3kj",
        price: 99.99,
        type: "course",
        date: "21/3/2020"),
    Transaction(
        id: 2,
        title: "Digital marketing and it's setbacks",
        receipt: "sfsfsdfeferf34",
        price: 29.99,
        type: "course",
        date: "21/4/2020"),
    Transaction(
        id: 3,
        title: "Role of networking in every industry",
        receipt: "qwqfdwew233dew",
        price: 19.99,
        type: "course",
        date: "21/5/2020"),
    Transaction(
        id: 4,
        title: "Designing and building a REST API in just 30 minutes",
        receipt: "akkj12h3kj121",
        price: 39.99,
        type: "course",
        date: "22/5/2020"),
    Transaction(
        id: 5,
        title: "Power of NANO technology and solar power role in NANO universe",
        receipt: "akjs43kj12h3kj",
        price: 59.99,
        type: "course",
        date: "23/5/2020"),
  ];

  @override
  Widget build(BuildContext context) {
//    _profileStackWidgetIndex = widget.isUserLoggedIn ? 3 : 0;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: IndexedStack(
        index: _profileStackWidgetIndex,
        children: <Widget>[
          SignInWidget(
            loginFormKey: _loginFormKey,
            validateEmail: (emailValue) {
              if (emailValue.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            validatePassword: (passwordValue) {
              if (passwordValue.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
            validateSignInForm: () {
              if (_loginFormKey.currentState.validate()) {
                setState(() {
                  _profileStackWidgetIndex = 3;
                });
              }
            },
            tappedForgotPasswordButton: () {
              setState(() {
                _profileStackWidgetIndex = 1;
              });
            },
            tappedSignUpButton: () {
              setState(() {
                _profileStackWidgetIndex = 2;
              });
            },
          ),
          ForgotPasswordWidget(
            forgotPasswordFormKey: _forgotPasswordFormKey,
            validateEmail: (emailValue) {
              if (emailValue.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            validateForgotPasswordForm: () {
              if (_forgotPasswordFormKey.currentState.validate()) {
                // Process data.
              }
            },
            tappedSignInButton: () {
              setState(() {
                _profileStackWidgetIndex = 0;
              });
            },
          ),
          SignUpWidget(
            signUpFormKey: _signUpFormKey,
            validateName: (nameValue) {
              if (nameValue.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            validateEmail: (emailValue) {
              if (emailValue.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            validatePassword: (passwordValue) {
              if (passwordValue.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
            validateSignUpForm: () {
              if (_signUpFormKey.currentState.validate()) {
                // Process data.
              }
            },
            tappedSignInButton: () {
              setState(() {
                _profileStackWidgetIndex = 0;
              });
            },
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  ProfileGravatarWidget(
                    imageUrl:
                        "https://s.gravatar.com/avatar/25cb5ac7177a6c05fecb69b1882d1757?s=300",
                    name: "Sagar Sandy",
                    email: "sagar@invanto.com",
                  ),
                  UpdateProfileWidget(
                    name: "Sagar Sandy",
                    bio:
                        "Developer, always trying to explore new technologies..",
                    profileFormKey: _profileFormKey,
                    validateName: (nameValue) {
                      if (nameValue.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    validateBio: (bioValue) {
                      if (bioValue.isEmpty) {
                        return 'Please enter short description about your bio';
                      }
                      return null;
                    },
                    validateProfileForm: () {
                      if (_profileFormKey.currentState.validate()) {
                        // Process data.
                      }
                    },
                  ),
                  ChangePasswordWidget(
                    passwordFormKey: _passwordFormKey,
                    validateCurrentPassword: (currentPasswordValue) {
                      if (currentPasswordValue.isEmpty) {
                        return 'Please enter your current password';
                      }
                      return null;
                    },
                    validateNewPassword: (newPasswordValue) {
                      if (newPasswordValue.isEmpty) {
                        return 'Password should be more than 6 characters';
                      }
                      return null;
                    },
                    validateConfirmPassword: (confirmPasswordValue) {
                      if (confirmPasswordValue.isEmpty) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    validateChangePasswordForm: () {
                      if (_passwordFormKey.currentState.validate()) {
                        // Process data.
                      }
                    },
                  ),
                  OrderHistoryWidget(_transactions),
                  SignOutWidget(
                    tappedSignOutButton: () {
                      setState(() {
                        _profileStackWidgetIndex = 0;
//                        widget.isUserLoggedIn = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
