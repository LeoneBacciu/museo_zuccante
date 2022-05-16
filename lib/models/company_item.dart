class Company {
  String title;
  String poster;
  bool stillActive;
  String body;
  String id;

  Company({
    required this.title,
    required this.poster,
    required this.stillActive,
    required this.body,
    required this.id,
  });

  Company.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        poster = json['poster'],
        stillActive = json['still_active'],
        body = json['body'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['poster'] = poster;
    data['still_active'] = stillActive;
    data['body'] = body;
    data['id'] = id;
    return data;
  }
}
