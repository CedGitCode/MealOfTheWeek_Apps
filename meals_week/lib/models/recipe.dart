class Recipe {

  late String _title;
  late int _grade;
  late List<String>? _hint;

  Recipe({required p_title, required p_grade, p_hint}) {
    _title = p_title;
    _grade = p_grade;
    _hint = p_hint;
  }

  String get title {
    return _title;
  }

  Map<String, dynamic> toJson() {
    return {
      'title':_title,
      'grade':_grade,
    };
  }

  int get grade {
    return _grade;
  }
}