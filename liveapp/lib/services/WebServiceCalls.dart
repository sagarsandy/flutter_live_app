import 'package:http/http.dart';
import 'dart:convert';

import 'package:liveapp/models/Course.dart';

class WebServiceCalls {
  Future<List<Course>> getCategoryCourses(url) async {
//    const url = "https://sagarsandy492.mock.pw/api/courses";
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

      return coursesData;
    } else {
      print("Something went wrong");
    }

    return null;
  }
}
