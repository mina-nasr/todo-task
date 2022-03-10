class TaskModel {
  TaskModel({this.title, this.description, this.isDone = 0});

  int? id;
  String? title;
  String? description;
  int isDone = 0;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "id": id,
      "title": title,
      "description": description,
      "isDone": isDone
    };
    return map;
  }

  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    description = map["description"];
    isDone = map["isDone"];
  }

  changeIsDone(Map<String, dynamic> map, bool checked) {
    return {
      "id": map["id"],
      "title": map["title"],
      "description": map["description"],
      "isDone": checked ? 1 : 0
    };
  }
}
