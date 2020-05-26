import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/widgets/CourseBlockThreeWidget.dart';

class SearchResultsScreen extends StatelessWidget {
  final String title;
  SearchResultsScreen(this.title);

  final List<Course> _serachedCourses = [
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
      title:
          "Web development bootcamp by Sagar Sandy this is log title by sagar sandy lets see how this is print",
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
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(0xFFC96FF7),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return CourseBlockThreeWidget(_serachedCourses[index]);
        },
        itemCount: _serachedCourses.length,
      ),
    );
  }
}
