import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/widgets/CoursesListBlockOneWidget.dart';
import 'package:http/http.dart';
import 'package:liveapp/widgets/CoursesListBlockTwoWidget.dart';
import 'dart:convert';

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
  Future<List<Course>> getTrendingCourses() async {
    const url = "https://sagarsandy492.mock.pw/api/courses";

    final response = await get(url);
    List<Course> coursesData = [];

    if (response.statusCode == 200) {
      print(response);
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
//    getTrendingCourses();
    super.initState();
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
      ),
      body: SingleChildScrollView(
        child: Container(
//        color: Colors.blueGrey.withOpacity(0.7),
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
