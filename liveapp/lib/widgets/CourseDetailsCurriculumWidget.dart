import 'package:flutter/material.dart';
import 'package:liveapp/models/Section.dart';

class CourseDetailsCurriculumWidget extends StatelessWidget {
  final List<Section> _courseSections;

  CourseDetailsCurriculumWidget(this._courseSections);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Curriculum",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 10,
            child: ExpansionTile(
              title: Text(_courseSections[index].title),
              children: <Widget>[
                Column(
                  children: _courseSections[index]
                      .contents
                      .map(
                        (e) => ListTile(
                          title: Text(e.title),
                          subtitle: Text(e.type),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      }, childCount: _courseSections.length),
    );
  }
}
