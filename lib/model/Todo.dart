class Todo {

  String _name;
  bool _completed;

  Todo(this._name, this._completed);

  bool get completed => _completed;

  String get name => _name;

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(json['title'], json['completed']);
  }

}