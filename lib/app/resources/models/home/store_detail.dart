class StoreDetail {
  int _id;
  String _name;

  StoreDetail(Map<String, dynamic> json) {
    _id = json['store_id'];
    _name = json['name'];
  }

  int get id => _id;
  String get name => _name;
}