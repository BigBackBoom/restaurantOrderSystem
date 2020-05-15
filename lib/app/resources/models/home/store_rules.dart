class StoreRulesList {
  List<Rule> _storeRules = [];

  StoreRulesList.fromJson(Map<String, dynamic>json) {
    List<Rule> temp = [];
    for (var i = 0; i < json['data'].length; i++) {
      temp.add(Rule(json['data'][i]));
    }
    _storeRules = temp;
  }

  List<Rule> get storeRules => _storeRules;
}

class Rule {

  String _title;
  String _description;

  Rule(Map<String, dynamic> json) {
    _title = json['title'];
    _description = json['description'];
  }

  String get title => _title;
  String get description => _description;
}