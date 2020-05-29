import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/widgets/CoursesListBlockOneWidget.dart';
import 'package:liveapp/widgets/CoursesListBlockTwoWidget.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  void initState() {
    getTrendingCourses();
    getCategory1Courses();
    getCategory2Courses();
    getCategory3Courses();
    super.initState();
  }

  List<Course> _categoryCourses1 = [];
  List<Course> _categoryCourses2 = [];
  List<Course> _categoryCourses3 = [];

  List<Course> _trendingCourses = [
    Course(
      id: 1,
      image: "https://i.picsum.photos/id/1/150/150.jpg",
      price: 11,
      title: "Introduction to docker and docking",
      author: "Docker Mastery",
      category: "Category 1",
    ),
    Course(
      id: 2,
      image: "https://i.picsum.photos/id/2/150/150.jpg",
      price: 21,
      title: "Jump to javascript in 60 days as a master in programming",
      author: "Javascript Learners Library",
      category: "Category 2",
    ),
    Course(
      id: 3,
      image: "https://i.picsum.photos/id/3/150/150.jpg",
      price: 31,
      title: "The ultimate guide to programers and techies",
      author: "Programming Library",
      category: "Category 3",
    ),
    Course(
      id: 4,
      image: "https://i.picsum.photos/id/4/150/150.jpg",
      price: 41,
      title: "Web development bootcamp by Sagar Sandy this is long",
      author: "Web Developers boot camps",
      category: "Category 4",
    ),
    Course(
      id: 5,
      image: "https://i.picsum.photos/id/5/150/150.jpg",
      price: 51,
      title: "Feedback sessions by feedback masters",
      author: "Feedback foliers",
      category: "Category 5",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
//          color: Colors.blueGrey.withOpacity(0.7),
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
                    "Trending courses of the month",
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
                    "Top Courses in Development",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF010a43),
                    ),
                  ),
                ),
              ),
              CoursesListBlockTwoWidget(_categoryCourses1),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Best Courses in Digital Marketing",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF010a43),
                    ),
                  ),
                ),
              ),
              CoursesListBlockTwoWidget(_categoryCourses2),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Popular Courses in Productivity",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF010a43),
                    ),
                  ),
                ),
              ),
              CoursesListBlockTwoWidget(_categoryCourses3),
            ],
          ),
        ),
      ),
    );
  }
}
