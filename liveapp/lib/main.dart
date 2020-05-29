import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/screens/SearchResultsScreen.dart';
import 'package:liveapp/widgets/CoursesListBlockOneWidget.dart';
import 'package:http/http.dart';
import 'package:liveapp/widgets/CoursesListBlockTwoWidget.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'The Professor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  Future<void> setDiskStorage() async {
    final diskStorage = await SharedPreferences.getInstance();

    print(diskStorage.getInt('userId'));

    diskStorage.setInt('userId', 492);

    print(diskStorage.getInt('userId'));
  }

  Future<List<Course>> getTrendingCourses() async {
    const url = "https://sagarsandy492.mock.pw/api/courses";

    final response = await get(url);
    List<Course> coursesData = [];

    if (response.statusCode == 200) {
//      print(response);
      var jsonData = json.decode(response.body);

      for (var c in jsonData) {
        Course course = Course(
            id: c["id"],
            title: c["title"],
            image: c["image"],
            price: c["price"],
            author: c["author"]);
        coursesData.add(course);
      }

      setState(() {
        _trendingCourses = coursesData;
      });
    } else {
      print("Something went wrong");
    }
  }

  var appBarTitle = "The Professor";
  @override
  void initState() {
    getTrendingCourses();
    setDiskStorage();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        appBarTitle = "My Profile";
      } else if (index == 1) {
        appBarTitle = "My Courses";
      } else {
        appBarTitle = "The Professor";
      }
    });
  }

  List<Course> _trendingCourses = [
    Course(
      id: 1,
      image: "https://i.picsum.photos/id/1/150/150.jpg",
      price: 11,
      title: "Introduction to docker and docking",
      author: "Docker Mastery",
    ),
    Course(
      id: 2,
      image: "https://i.picsum.photos/id/2/150/150.jpg",
      price: 21,
      title: "Jump to javascript in 60 days as a master in programming",
      author: "Javascript Learners Library",
    ),
    Course(
      id: 3,
      image: "https://i.picsum.photos/id/3/150/150.jpg",
      price: 31,
      title: "The ultimate guide to programers and techies",
      author: "Programming Library",
    ),
    Course(
      id: 4,
      image: "https://i.picsum.photos/id/4/150/150.jpg",
      price: 41,
      title:
          "Web development bootcamp by Sagar Sandy this is log title by sagar sandy lets see how this is print",
      author: "Web Developers boot camps",
    ),
    Course(
      id: 5,
      image: "https://i.picsum.photos/id/5/150/150.jpg",
      price: 51,
      title: "Feedback sessions by feedback masters",
      author: "Feedback foliers",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.cyan.withAlpha(10),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Color(0xFFC96FF7),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchCourses());
            },
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 70.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.account_circle, size: 30),
        ],
        color: Color(0xFFC96FF7),
        buttonBackgroundColor: Color(0xFFC96FF7),
        backgroundColor: Colors.cyan.withAlpha(10),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 200),
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
//          color: Colors.blueGrey.withOpacity(0.7),
//        color: Colors.white,
          color: Colors.cyan.withAlpha(10),
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Trending courses of the week",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF010a43),
                      ),
                    ),
                  ),
                ),
                CoursesListBlockOneWidget(_trendingCourses),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Top Courses in Programming",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF010a43),
                      ),
                    ),
                  ),
                ),
                CoursesListBlockTwoWidget(_trendingCourses),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Top Courses in Programming",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF010a43),
                      ),
                    ),
                  ),
                ),
                CoursesListBlockTwoWidget(_trendingCourses),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Top Courses in Programming",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF010a43),
                      ),
                    ),
                  ),
                ),
                CoursesListBlockTwoWidget(_trendingCourses),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchCourses extends SearchDelegate<String> {
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
                      SearchResultsScreen(suggestionList[index])));
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
        MaterialPageRoute(builder: (context) => SearchResultsScreen(query)));
  }
}
