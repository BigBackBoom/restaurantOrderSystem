import 'package:letme_app/app/resources/models/language/language.dart';

class LanguageList {
  List<Language> _languageList = [];

  LanguageList.fromJson(Map<String, dynamic>json) {
    List<Language> temp = [];
    for (var i = 0; i < json['languages'].length; i++) {
      temp.add(Language(json['languages'][i]));
    }
    _languageList = temp;
  }

  List<Language> get languageList => _languageList;
}