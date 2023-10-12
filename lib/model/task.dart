class Task {
  int? id;
  String? title;
  String? note;
  int? color;

  //-------------- constructor
  Task({
    this.id,
    this.title,
    this.note,
    this.color,
  });

  //-------------- fromJson
  Task.fromJson_(Map<String, dynamic> _json) {
    id = _json['id'];
    title = _json['title'];
    note = _json['note'];
    color = _json['color'];
  }

  //-------------- toJson
  Map<String, dynamic> toJson_() {

    return {
      "title": title,
      "note": note,
      "color": color,
    };
  }
}
