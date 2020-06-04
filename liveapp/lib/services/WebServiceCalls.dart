import 'package:http/http.dart';
import 'package:liveapp/models/Author.dart';
import 'package:liveapp/models/Content.dart';
import 'dart:convert';

import 'package:liveapp/models/Course.dart';
import 'package:liveapp/models/Section.dart';

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
    }

    print("API call failed");
    return null;
  }

  Future<List> getCategories(url) async {
//    const url = "https://sagarsandy492.mock.pw/api/categories";
    final response = await get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      return jsonData;
    }

    print("API call failed");
    return null;
  }

  Future getCourseCurriculum(url) async {
//    const url = "https://sagarsandy492.mock.pw/api/shortcurriculum";
    final response = await get(url);

    if (response.statusCode == 200) {
      List<Section> courseSectionsData = [];
      var jsonData = json.decode(response.body);
      for (var sectionData in jsonData["data"]) {
        List<Content> currentSectionContents = [];
        var sectionContents = sectionData["contents"];

        for (var sectionContent in sectionContents) {
          Content content = Content(
              id: sectionContent["id"],
              title: sectionContent["title"],
              type: sectionContent["type"]);

          currentSectionContents.add(content);
        }

        Section section = Section(
            id: sectionData["id"],
            title: sectionData["title"],
            contents: currentSectionContents);

        courseSectionsData.add(section);
      }

      final courseCurriculumData = {
        "totalSections": jsonData["totalSections"],
        "sections": courseSectionsData
      };

      return courseCurriculumData;
    }

    print("API call failed");
    return null;
  }

  Future<Author> getCourseAuthor(url) async {
//    const url = "https://sagarsandy492.mock.pw/api/author";
    final response = await get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      Author author = Author(
        id: jsonData["id"],
        name: jsonData["name"],
        image: jsonData["image"],
        coursesCount: jsonData["coursesCount"],
        bio: jsonData["bio"],
      );

      return author;
    }

    print("API call failed");
    return null;
  }
}
