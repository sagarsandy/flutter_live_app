import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveapp/models/Course.dart';
import 'package:liveapp/screens/CoursesListingScreen.dart';
import 'package:liveapp/screens/ProfileScreen.dart';
import 'package:liveapp/services/SearchDelegateService.dart';
import 'package:liveapp/services/WebServiceCalls.dart';
import 'package:liveapp/widgets/CourseBlockFourWidget.dart';
import 'package:liveapp/widgets/CoursesListBlockOneWidget.dart';
import 'package:liveapp/widgets/CoursesListBlockTwoWidget.dart';
import 'package:liveapp/widgets/HomePageTitlePadding.dart';
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
//        textTheme:
//            GoogleFonts.robotoCondensedTextTheme(Theme.of(context).textTheme),
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

  Future getTrendingCourses() async {
    final data = await WebServiceCalls()
        .getCategoryCourses("https://sagarsandy492.mock.pw/api/courses");

    setState(() {
      _trendingCourses = data;
      _trendingCourses.shuffle();
    });
  }

  Future getCategoryOneCourses() async {
    final data = await WebServiceCalls()
        .getCategoryCourses("https://sagarsandy492.mock.pw/api/searchcourses");

    setState(() {
      _categoryCourses1 = data;
      _categoryCourses1.shuffle();
    });
  }

  Future getCategoryTwoCourses() async {
    final data = await WebServiceCalls()
        .getCategoryCourses("https://sagarsandy492.mock.pw/api/courses");

    setState(() {
      _categoryCourses2 = data;
      _categoryCourses2.shuffle();
    });
  }

  Future getCategoryThreeCourses() async {
    final data = await WebServiceCalls()
        .getCategoryCourses("https://sagarsandy492.mock.pw/api/searchcourses");

    setState(() {
      _categoryCourses3 = data;
      _categoryCourses3.shuffle();
    });
  }

  Future getCategoriesData() async {
    final data = await WebServiceCalls()
        .getCategories("https://sagarsandy492.mock.pw/api/categories");

    setState(() {
      _categories = data;
    });
  }

  void navigateToCoursesListingScreen(context, title) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CoursesListingScreen(title)));
  }

  var appBarTitle = "The Professor";
  @override
  void initState() {
    getTrendingCourses();
    getCategoryOneCourses();
    getCategoryTwoCourses();
    getCategoryThreeCourses();
    getCategoriesData();
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

  List<Course> _trendingCourses = [];
  List<Course> _categoryCourses1 = [];
  List<Course> _categoryCourses2 = [];
  List<Course> _categoryCourses3 = [];
  List _categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Color(0xFFC96FF7),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchDelegateService(_categories));
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
      child: ProfileScreen(),
    );
  }

  Widget getHomeContainer() {
    return FadeTransition(
      opacity: _animation,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.cyan.withAlpha(10),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: <Widget>[
                HomePageTitlePadding(
                  title: "Trending Courses",
                  verticalPadding: 15.0,
                  onTap: () {
                    navigateToCoursesListingScreen(context, "Trending Courses");
                  },
                ),
                CoursesListBlockOneWidget(_trendingCourses),
                HomePageTitlePadding(
                  title: "Top Courses in Development",
                  verticalPadding: 1.0,
                  onTap: () {
                    navigateToCoursesListingScreen(context, "Development");
                  },
                ),
                CoursesListBlockTwoWidget(_categoryCourses1),
                HomePageTitlePadding(
                  title: "Best Courses in Digital Marketing",
                  verticalPadding: 1.0,
                  onTap: () {
                    navigateToCoursesListingScreen(
                        context, "Digital Marketing");
                  },
                ),
                CoursesListBlockTwoWidget(_categoryCourses2),
                HomePageTitlePadding(
                  title: "Popular Courses in Productivity",
                  verticalPadding: 1.0,
                  onTap: () {
                    navigateToCoursesListingScreen(context, "Productivity");
                  },
                ),
                CoursesListBlockTwoWidget(_categoryCourses3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
