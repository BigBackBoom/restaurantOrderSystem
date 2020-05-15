import 'package:letme_app/app/repositories/store_detail_repository.dart';
import 'package:letme_app/app/resources/models/home/store_reviews.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailReviewBloc {
  final _repository = StoreDetailRepository();
  final _result = BehaviorSubject<StoreReviewList>();
  Stream<StoreReviewList> storeRules;

  StoreDetailReviewBloc(int id) {
    storeRules = _result.stream;
    _fetchStoreDetailReview(id);
  }

  void _fetchStoreDetailReview(int id) async {
    await _repository.fetchStoreReview(id).then((value) {
      _result.sink.add(value);
    });
  }

  void dispose() {
    _result.close();
  }
}
