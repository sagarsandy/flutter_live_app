import 'package:flutter/material.dart';

class UpdateProfileWidget extends StatelessWidget {
  final String name;
  final String bio;
  final GlobalKey<FormState> profileFormKey;
  final Function validateName;
  final Function validateBio;
  final Function validateProfileForm;

  UpdateProfileWidget(
      {Key key,
      this.name,
      this.bio,
      this.profileFormKey,
      this.validateName,
      this.validateBio,
      this.validateProfileForm})
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
            "Update Profile",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade300),
          ),
          children: <Widget>[
            Form(
              key: profileFormKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextFormField(
                          initialValue: name,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                          validator: validateName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          initialValue: bio,
                          decoration: const InputDecoration(
                            labelText: 'Bio',
                          ),
                          validator: validateBio,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: RaisedButton(
                          color: Color(0xFFC96FF7),
                          textColor: Colors.white,
                          onPressed: validateProfileForm,
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
