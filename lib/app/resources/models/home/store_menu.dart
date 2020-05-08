class StoreMenuList {
  List<StoreMenu> _storeMenuList = [];

  StoreMenuList.fromJson(Map<String, dynamic>json) {
    List<StoreMenu> temp = [];
    for (var i = 0; i < json['data'].length; i++) {
      temp.add(StoreMenu(json['data'][i]));
    }
    _storeMenuList = temp;
  }

  List<StoreMenu> get storeMenuList => _storeMenuList;
}

class StoreMenu {
  int _categoryId;
  String _categoryName;
  List<Menu> _menu;

  StoreMenu(Map<String, dynamic> json) {
    _categoryId = json['id'];
    _categoryName = json['name'];

    List<Menu> temp = [];
    for (var i = 0; i < json['menu'].length; i++) {
      temp.add(Menu(json['menu'][i]));
    }

    _menu = temp;
  }

  int get categoryId => _categoryId;
  String get categoryName => _categoryName;
  List<Menu> get menu => _menu;
}

class Menu {

  int _id;
  String _name;
  int _price;
  String _imgUrl;

  Menu(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _imgUrl = json['img'];
  }

  int get id => _id;
  String get name => _name;
  int get price => _price;
  String get imgUrl => _imgUrl;

}