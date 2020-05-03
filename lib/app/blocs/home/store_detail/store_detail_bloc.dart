import 'package:letme_app/app/repositories/store_detail_repository.dart';
import 'package:letme_app/app/resources/models/home/store_detail.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailBloc {
  final _repository = StoreDetailRepository();
  final _result = BehaviorSubject<StoreDetail>();
  Stream<StoreDetail> storeDetail;

  StoreDetailBloc(int id) {
    storeDetail = _result.stream;
    _fetchStoreDetail(id);
  }

  void _fetchStoreDetail(int id) async {
    await _repository.fetchStoreDetail(id).then((value) {
      _result.sink.add(value);
    });
  }

  void dispose() {
    _result.close();
  }
}
