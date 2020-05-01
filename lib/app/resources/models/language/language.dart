class Language {
  int _id;
  String _languageName;

  Language(Map<String, dynamic> json) {
    _id = json['id'];
    _languageName = json['name'];
  }

  int get id => _id;
  String get languageName => _languageName;
}