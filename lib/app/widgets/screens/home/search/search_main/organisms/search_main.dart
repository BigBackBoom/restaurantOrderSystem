import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/blocs/home/search/search_bloc.dart';
import 'package:letme_app/app/resources/models/home/search_main.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/home/search/search_main/molecules/search_main_gallery.dart';
import 'package:letme_app/app/widgets/screens/home/search/search_main/molecules/search_text_field_dummy.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';
import 'package:provider/provider.dart';

class SearchMain extends StatefulWidget {
  @override
  _SearchMainState createState() => _SearchMainState();
}

class _SearchMainState extends State<SearchMain> {
  SearchBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = Provider.of<SearchBloc>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Center(
              child: Text(
                  LocalizationStrings.of(context).getWithKey("home_search_title"),
                  style: TextStyle(
                    color: LetmeAppColor.primary[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                right: 24,
                left: 24
            ),
            child: SearchTextFieldDummy(),
          ),
          StreamBuilder(
              stream: _bloc.searchMain,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  SearchMainContents data = snapshot.data;

                  List<Widget> widgets = [];

                  // creating small size gallery
                  List<SearchMainGallery> restaurantContainers = [];
                  for (var i = 0; i < data.restaurantList.length; i++) {
                    List<RestaurantImage> imageContainer = [];
                    for (var j = 0; j < data.restaurantList[i].restaurantList.length; j++) {
                      imageContainer.add(
                          RestaurantImage(
                              title: data.restaurantList[i].restaurantList[j].title,
                              imgUrl: data.restaurantList[i].restaurantList[j].imgUrl
                          )
                      );
                    }
                    restaurantContainers.add(
                        SearchMainGallery(
                          categoryName: data.restaurantList[i].title,
                          imgList: imageContainer,
                          imageHeight: 88,
                          imageWidth: 148,
                          titleMargin: EdgeInsets.only(
                              top: 24,
                              left: 24,
                              right: 24,
                              bottom: 12
                          ),
                          galleryPadding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                        )
                    );
                  }
                  widgets.addAll(restaurantContainers);

                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widgets,
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.all(48),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
