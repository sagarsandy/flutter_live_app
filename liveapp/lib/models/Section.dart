import 'package:liveapp/models/Content.dart';

class Section {
  final int id;
  final String title;
  final List<Content> contents;

  Section({this.id, this.title, this.contents});
}
