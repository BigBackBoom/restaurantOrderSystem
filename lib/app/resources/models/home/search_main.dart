class SearchMainContents {
  CategorizedRestaurants _nearByRestaurant;
  List<CategorizedRestaurants> _categorizedRestaurantsList;

  SearchMainContents(Map<String, dynamic> json) {
    _nearByRestaurant = CategorizedRestaurants(json['near_restaurant']);

    List<CategorizedRestaurants> temp = [];
    for (var i = 0; i < json['categoried_restraunts_list'].length; i++) {
      temp.add(CategorizedRestaurants(json['categoried_restraunts_list'][i]));
    }
    _categorizedRestaurantsList = temp;
  }

  CategorizedRestaurants get nearByRestaurant => _nearByRestaurant;
  List<CategorizedRestaurants> get restaurantList => _categorizedRestaurantsList;
}

class CategorizedRestaurants {

  int _categoryId;
  String _title;
  List<Restaurant> _restaurantList;

  CategorizedRestaurants(Map<String, dynamic> json) {
    _categoryId = json['category_id'];
    _title = json['title'];

    List<Restaurant> temp = [];
    for (var i = 0; i < json['restaurant_list'].length; i++) {
      temp.add(Restaurant(json['restaurant_list'][i]));
    }
    _restaurantList = temp;
  }

  int get categoryId => _categoryId;
  String get title => _title;
  List<Restaurant> get restaurantList => _restaurantList;
}


class Restaurant {

  int _id;
  String _title;
  String _imgUrl;

  Restaurant(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _imgUrl = json['img_url'];
  }

  int get id => _id;
  String get title => _title;
  String get imgUrl => _imgUrl;
}
