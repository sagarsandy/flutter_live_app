import 'package:flutter/material.dart';
import 'package:liveapp/models/Transaction.dart';
import 'package:liveapp/widgets/FormInputWidget.dart';

class ProfileScreen extends StatefulWidget {
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
          Form(
            key: _loginFormKey,
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
                    height: 330,
                    child: Column(
                      children: <Widget>[
                        FormInputWidget(
                            leftPadding: 20.0,
                            rightPadding: 20.0,
                            topPadding: 25.0,
                            bottomPadding: 0.0,
                            labelText: "Email",
                            errorMessage: "Please enter email",
                            onValidate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            }),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 25),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                          child: RaisedButton(
                            color: Color(0xFFC96FF7),
                            textColor: Colors.white,
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_loginFormKey.currentState.validate()) {
                                setState(() {
                                  _profileStackWidgetIndex = 3;
                                });
                              }
                            },
                            child: Text('SignIn'),
                          ),
                        ),
                        GestureDetector(
                          child: Text("Forgot Password?",
                              style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFFC96FF7))),
                          onTap: () {
                            setState(() {
                              _profileStackWidgetIndex = 1;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: GestureDetector(
                            child: Text("Click here to SignUp",
                                style: TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFFC96FF7))),
                            onTap: () {
                              setState(() {
                                _profileStackWidgetIndex = 2;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Form(
            key: _forgotPasswordFormKey,
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
                    height: 320,
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                          child: RaisedButton(
                            color: Color(0xFFC96FF7),
                            textColor: Colors.white,
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_forgotPasswordFormKey.currentState
                                  .validate()) {
                                // Process data.
                              }
                            },
                            child: Text('Forgot Password'),
                          ),
                        ),
                        GestureDetector(
                          child: Text("Back to Login",
                              style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFFC96FF7))),
                          onTap: () {
                            setState(() {
                              _profileStackWidgetIndex = 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Form(
            key: _signUpFormKey,
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Name',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                          child: RaisedButton(
                            color: Color(0xFFC96FF7),
                            textColor: Colors.white,
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_signUpFormKey.currentState.validate()) {
                                // Process data.
                              }
                            },
                            child: Text('SignUp'),
                          ),
                        ),
                        GestureDetector(
                          child: Text("Back to Login",
                              style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFFC96FF7))),
                          onTap: () {
                            setState(() {
                              _profileStackWidgetIndex = 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(
                                "https://s.gravatar.com/avatar/25cb5ac7177a6c05fecb69b1882d1757?s=300"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Sagar Sandy",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Text(
                            "(sagar@invanto.com)",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      elevation: 10,
                      child: ExpansionTile(
                        title: Text(
                          "Update Profile",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade300),
                        ),
                        children: <Widget>[
                          Form(
                            key: _profileFormKey,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 20),
                                      child: TextFormField(
                                        initialValue: "Sagar Sandy",
                                        decoration: const InputDecoration(
                                          labelText: 'Name',
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: const InputDecoration(
                                          hintText:
                                              'Enter a short summary about you',
                                          labelText: 'Bio',
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a short summary about you';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 5),
                                      child: RaisedButton(
                                        color: Color(0xFFC96FF7),
                                        textColor: Colors.white,
                                        onPressed: () {
                                          // Validate will return true if the form is valid, or false if
                                          // the form is invalid.
                                          if (_profileFormKey.currentState
                                              .validate()) {
                                            // Process data.
                                          }
                                        },
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
//                      color: Colors.red,
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
                            key: _passwordFormKey,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Current Password',
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your current password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 20, right: 20),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'New Password',
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Password should be morethan 6 characters';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 20, right: 20),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Confirm Password',
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 5),
                                      child: RaisedButton(
                                        color: Color(0xFFC96FF7),
                                        textColor: Colors.white,
                                        onPressed: () {
                                          // Validate will return true if the form is valid, or false if
                                          // the form is invalid.
                                          if (_passwordFormKey.currentState
                                              .validate()) {
                                            // Process data.
                                          }
                                        },
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      elevation: 10,
                      child: ExpansionTile(
                        title: Text(
                          "Order History",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade300),
                        ),
                        children: <Widget>[
                          Column(
                            children: _transactions
                                .map(
                                  (e) => Card(
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            e.title,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Receipt: " + e.receipt,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                                Text(
                                                  "₹" + e.price.toString(),
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "Date: " + e.date,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Card(
                      elevation: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _profileStackWidgetIndex = 0;
                          });
                        },
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
