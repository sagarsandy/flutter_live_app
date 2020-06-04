import 'package:flutter/material.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/services/WebServiceCalls.dart';
import 'package:liveapp/widgets/CourseBlockThreeWidget.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CoursesListingScreen extends StatefulWidget {
  final String title;
  CoursesListingScreen(this.title);

  @override
  _CoursesListingScreenState createState() => _CoursesListingScreenState();
}

class _CoursesListingScreenState extends State<CoursesListingScreen> {
  List<Course> _searchedCourses = [];
  var _scrollController = ScrollController();
  bool showLoader = false;

  Future getCoursesData() async {
    final data = await WebServiceCalls()
        .getCategoryCourses("https://sagarsandy492.mock.pw/api/courses");

    setState(() {
      _searchedCourses = data;
    });
  }

  Future getMoreCoursesData() async {
    final data = await WebServiceCalls()
        .getCategoryCourses("https://sagarsandy492.mock.pw/api/searchcourses");

    setState(() {
      _searchedCourses = _searchedCourses + data;
      showLoader = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getCoursesData();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // Top
          print("Top Scroller");
        } else {
          setState(() {
            showLoader = true;
            getMoreCoursesData();
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFFC96FF7),
      ),
      body: _searchedCourses.isEmpty
          ? Container(
              child: Center(
                child: Container(
                  height: 200,
                  child: ScalingText(
                    "Loading..",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            )
          : CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CourseBlockThreeWidget(
                      _searchedCourses[index],
                    );
                  }, childCount: _searchedCourses.length),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    child: Center(
                      child: showLoader
                          ? Container(
                              height: 100,
                              child: ScalingText(
                                "Loading..",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
