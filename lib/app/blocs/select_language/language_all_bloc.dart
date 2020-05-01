import 'package:letme_app/app/repositories/language_repository.dart';
import 'package:letme_app/app/resources/models/language/language_list.dart';
import 'package:rxdart/rxdart.dart';

class LanguageAllBloc {
  final _repository = LanguageRepository();
  final _result = PublishSubject<LanguageList>();

  Stream<LanguageList> allLanguage;

  LanguageAllBloc() {
    _fetchAllLanguage();
    allLanguage = _result.stream;
  }

  void _fetchAllLanguage() async {
    await _repository.fetchAllLanguage().then((value) {
      _result.sink.add(value);
    });
  }

  void dispose() {
    _result.close();
  }
}
