import 'package:geolocator/geolocator.dart';
import 'package:letme_app/app/blocs/base_bloc.dart';
import 'package:letme_app/app/repositories/search_repository.dart';
import 'package:letme_app/app/resources/models/home/search_main.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc implements BaseBloc {
  final _repository = SearchRepository();
  final _result = BehaviorSubject<SearchMainContents>();
  final _position = BehaviorSubject<Position>();
  Stream<SearchMainContents> searchMain;
  Stream<Position> position;

  SearchBloc() {
    searchMain = _result.stream;
    position = _position.stream;
    _fetchSearchMain();
    getCurrentLocation();
  }

  void _fetchSearchMain() async {
    await _repository.fetchSearchMain().then((value) {
      _result.sink.add(value);
    });
  }

  void getCurrentLocation() async {
    await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) => _position.sink.add(value));
  }

  void dispose() {
    _result.close();
    _position.close();
  }
}
