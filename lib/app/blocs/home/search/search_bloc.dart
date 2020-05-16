import 'package:letme_app/app/blocs/base_bloc.dart';
import 'package:letme_app/app/repositories/search_repository.dart';
import 'package:letme_app/app/resources/models/home/search_main.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc implements BaseBloc{

  final _repository = SearchRepository();
  final _result = BehaviorSubject<SearchMainContents>();
  Stream<SearchMainContents> searchMain;

  SearchBloc(){
    searchMain = _result.stream;
    _fetchSearchMain();
  }

  void _fetchSearchMain() async {
    await _repository.fetchSearchMain().then((value) {
      _result.sink.add(value);
    });
  }

  void dispose() {
    _result.close();
  }

}