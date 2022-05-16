import 'package:museo_zuccante/models/item_room.dart';

class Room {
  String title;
  int floor;
  int number;
  String? pixelX;
  String? pixelY;
  String id;
  List<Item> items;

  Room({
    required this.title,
    required this.floor,
    required this.number,
    this.pixelX,
    this.pixelY,
    required this.id,
    required this.items,
  });

  Room.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        floor = json['floor'],
        number = json['number'],
        pixelX = json['pixel_x'],
        pixelY = json['pixel_y'],
        id = json['id'],
        items = json['items'].map<Room>((e) => Item.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['floor'] = floor;
    data['number'] = number;
    data['pixel_x'] = pixelX;
    data['pixel_y'] = pixelY;
    data['id'] = id;
    data['items'] = items;
    return data;
  }
}
