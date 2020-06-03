import 'package:flutter/material.dart';
import 'package:liveapp/screens/CoursesListingScreen.dart';

class SearchDelegateService extends SearchDelegate<String> {
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "Enter a title";
  @override
  // TODO: implement textInputAction
  TextInputAction get textInputAction => TextInputAction.search;

  final categories = [
    "Select",
    "Development",
    "Marketing",
    "Productivity",
    "Business",
    "Accounting",
    "LifeStyle",
    "Photography",
    "Music",
    "Health",
    "Productivity",
  ];

  final recentCategories = [
    "Select",
    "Development",
    "Marketing",
    "Productivity",
    "Business",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
//      IconButton(
//        icon: Icon(Icons.search),
//        onPressed: () {
//          print(query);
//        },
//      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
//    final suggestionList = query.isEmpty ? recentCategories : categories;
    final suggestionList = categories;

    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            title: Text("Or, Select a Category"),
          );
        } else {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CoursesListingScreen(suggestionList[index])));
            },
            leading: Icon(Icons.location_city),
            title: Text(suggestionList[index]),
          );
        }
      },
      itemCount: suggestionList.length,
    );
  }

  @override
  void showResults(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CoursesListingScreen(query)));
  }
}
