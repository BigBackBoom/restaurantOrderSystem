import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/widgets/screens/home/search/search_main/organisms/search_main.dart';

class SearchTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: new SafeArea(
            child: SearchMain()
        )
    );
  }
}