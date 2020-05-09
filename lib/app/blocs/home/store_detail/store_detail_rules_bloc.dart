import 'package:letme_app/app/repositories/store_detail_repository.dart';
import 'package:letme_app/app/resources/models/home/store_rules.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailRulesBloc {
  final _repository = StoreDetailRepository();
  final _result = BehaviorSubject<StoreRulesList>();
  Stream<StoreRulesList> storeRules;

  StoreDetailRulesBloc(int id) {
    storeRules = _result.stream;
    _fetchStoreDetailRules(id);
  }

  void _fetchStoreDetailRules(int id) async {
    await _repository.fetchStoreRules(id).then((value) {
      _result.sink.add(value);
    });
  }

  void dispose() {
    _result.close();
  }
}
