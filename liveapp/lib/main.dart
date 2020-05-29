import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/screens/SearchResultsScreen.dart';
import 'package:liveapp/services/SearchDelegateService.dart';
import 'package:liveapp/widgets/CourseBlockFourWidget.dart';
import 'package:http/http.dart';
import 'package:liveapp/widgets/CoursesListBlockOneWidget.dart';
import 'package:liveapp/widgets/CoursesListBlockTwoWidget.dart';
import 'package:liveapp/widgets/HomePageTitlePadding.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

enum WidgetMarker { home, purchased, profile }

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
      home: MyHomePage(title: 'Money Heist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin<MyHomePage> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.home;
  AnimationController _controller;
  Animation _animation;
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
        coursesData.shuffle();
        _trendingCourses = coursesData;
      });
    } else {
      print("Something went wrong");
    }
  }

  Future<List<Course>> getCategory1Courses() async {
    const url = "https://sagarsandy492.mock.pw/api/courses";
    final response = await get(url);
    List<Course> coursesData = [];
    if (response.statusCode == 200) {
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
        _categoryCourses1 = coursesData;
        _categoryCourses1.shuffle();
      });
    } else {
      print("Something went wrong");
    }
  }

  Future<List<Course>> getCategory2Courses() async {
    const url = "https://sagarsandy492.mock.pw/api/courses";
    final response = await get(url);
    List<Course> coursesData = [];
    if (response.statusCode == 200) {
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
        _categoryCourses2 = coursesData;
        _categoryCourses2.shuffle();
      });
    } else {
      print("Something went wrong");
    }
  }

  Future<List<Course>> getCategory3Courses() async {
    const url = "https://sagarsandy492.mock.pw/api/courses";
    final response = await get(url);
    List<Course> coursesData = [];
    if (response.statusCode == 200) {
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
        _categoryCourses3 = coursesData;
        _categoryCourses3.shuffle();
      });
    } else {
      print("Something went wrong");
    }
  }

  var appBarTitle = "The Professor";
  @override
  void initState() {
    getTrendingCourses();
    getCategory1Courses();
    getCategory2Courses();
    getCategory3Courses();
    setDiskStorage();
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        appBarTitle = "My Profile";
        selectedWidgetMarker = WidgetMarker.profile;
      } else if (index == 1) {
        appBarTitle = "My Courses";
        selectedWidgetMarker = WidgetMarker.purchased;
      } else {
        appBarTitle = "The Professor";
        selectedWidgetMarker = WidgetMarker.home;
      }
    });
  }

  List<Course> _categoryCourses1 = [];
  List<Course> _categoryCourses2 = [];
  List<Course> _categoryCourses3 = [];
  List<Course> _trendingCourses = [];

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
      body: FutureBuilder(
        future: _playAnimation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return getCustomContainer();
        },
      ),
    );
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.home:
        return getHomeContainer();
      case WidgetMarker.purchased:
        return getPurchasedCoursesContainer();
      case WidgetMarker.profile:
        return getProfileContainer();
    }
    return getHomeContainer();
  }

  Widget getPurchasedCoursesContainer() {
    return FadeTransition(
      opacity: _animation,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return CourseBlockFourWidget(_trendingCourses[index]);
        },
        itemCount: _trendingCourses.length,
      ),
    );
  }

  Widget getProfileContainer() {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        color: Colors.blue,
        height: 400,
      ),
    );
  }

  Widget getHomeContainer() {
    return FadeTransition(
      opacity: _animation,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.cyan.withAlpha(10),
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              children: <Widget>[
                HomePageTitlePadding("Top Courses in Development", 15.0),
                CoursesListBlockOneWidget(_trendingCourses),
                HomePageTitlePadding("Top Courses in Development", 1.0),
                CoursesListBlockTwoWidget(_categoryCourses1),
                HomePageTitlePadding("Best Courses in Digital Marketing", 1.0),
                CoursesListBlockTwoWidget(_categoryCourses2),
                HomePageTitlePadding("Popular Courses in Productivity", 1.0),
                CoursesListBlockTwoWidget(_categoryCourses3),
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
