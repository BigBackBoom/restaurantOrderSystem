import 'package:geolocator/geolocator.dart';
import 'package:letme_app/app/blocs/base_bloc.dart';
import 'package:letme_app/app/repositories/search_repository.dart';
import 'package:letme_app/app/resources/models/error.dart';
import 'package:letme_app/app/resources/models/home/search_main.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc implements BaseBloc {
  final _repository = SearchRepository();
  final _result = BehaviorSubject<SearchMainContents>();
  final _error = PublishSubject<Error>();
  final _position = BehaviorSubject<Position>();

  Stream<SearchMainContents> searchMain;
  Stream<Error> error;
  Stream<Position> position;

  SearchBloc() {
    searchMain = _result.stream;
    error = _error.stream;
    position = _position.stream;
    _fetchSearchMain();
  }

  void _fetchSearchMain() async {
    // acquire position
    getCurrentLocation();

    // whenever position is updated fetch data
    position.distinct().listen((pos) {
      _repository.fetchSearchMain(pos.latitude, pos.longitude).then((value) {
        if (value.data is SearchMainContents) {
          _result.sink.add(value.data);
        } else if (value.data is Error) {
          _error.sink.add(value.data);
        }
      });
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
    _error.close();
  }
}
