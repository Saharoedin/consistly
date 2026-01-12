class Task {
  String? taskId;
  String? goalId;
  String? date;
  String? title;
  bool? completed;

  Task({this.taskId, this.goalId, this.date, this.title, this.completed});

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    goalId = json['goalId'];
    date = json['date'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['taskId'] = taskId;
    data['goalId'] = goalId;
    data['date'] = date;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
