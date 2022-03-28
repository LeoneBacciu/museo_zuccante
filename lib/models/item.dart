import 'package:museo_zuccante/models/company.dart';
import 'package:museo_zuccante/models/room.dart';

class Item {
  String title;
  String author;
  String subtitle;
  String poster;
  bool highlighted;
  String body;
  Room room;
  Company company;
  String id;

  Item({
    required this.title,
    required this.author,
    required this.subtitle,
    required this.poster,
    required this.highlighted,
    required this.body,
    required this.room,
    required this.company,
    required this.id,
  });

  Item.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        author = json['author'],
        subtitle = json['subtitle'],
        poster = json['poster'],
        highlighted = json['highlighted'],
        body = json['body'],
        room = Room.fromJson(json['room']),
        company = Company.fromJson(json['company']),
        id = json['id'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['author'] = author;
    data['subtitle'] = subtitle;
    data['poster'] = poster;
    data['highlighted'] = highlighted;
    data['body'] = body;
    data['room'] = room.toJson();
    data['company'] = company.toJson();
    data['id'] = id;
    return data;
  }
}
