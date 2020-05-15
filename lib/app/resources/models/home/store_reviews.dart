class StoreReviewList {
  List<Review> _storeReviews = [];

  StoreReviewList.fromJson(Map<String, dynamic>json) {
    List<Review> temp = [];
    for (var i = 0; i < json['data'].length; i++) {
      temp.add(Review(json['data'][i]));
    }
    _storeReviews = temp;
  }

  List<Review> get storeReviews => _storeReviews;
}

class Review {

  String _title;
  String _description;
  String _userImg;
  List<String> _reviewImg = [];

  Review(Map<String, dynamic> json) {
    _title = json['title'];
    _description = json['description'];
    _userImg = json['user_image'];
    _reviewImg = json['review_image'];
  }

  String get title => _title;
  String get description => _description;
  String get userImg => _userImg;
  List<String> get reviewImg => _reviewImg;

}