import 'package:letme_app/app/repositories/store_detail_repository.dart';
import 'package:letme_app/app/resources/models/home/store_detail.dart';
import 'package:letme_app/app/resources/models/home/store_menu.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailMenuBloc {
  final _repository = StoreDetailRepository();
  final _result = BehaviorSubject<StoreMenuList>();
  Stream<StoreMenuList> storeMenuList;

  StoreDetailMenuBloc(int id) {
    storeMenuList = _result.stream;
    _fetchStoreDetailMenu(id);
  }

  void _fetchStoreDetailMenu(int id) async {
    await _repository.fetchStoreMenuList(id).then((value) {
      _result.sink.add(value);
    });
  }

  void dispose() {
    _result.close();
  }
}
