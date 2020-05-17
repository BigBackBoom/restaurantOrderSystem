import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/blocs/home/search/search_bloc.dart';
import 'package:letme_app/app/resources/models/home/search_main.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/home/search/search_main/molecules/search_main_gallery.dart';
import 'package:letme_app/app/widgets/screens/home/search/search_main/molecules/search_text_field_dummy.dart';
import 'package:letme_app/app/widgets/screens/util/atoms/loading_img.dart';
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
                  LocalizationStrings.of(context).getWithKey(
                      "home_search_title"),
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

                  // Carousel
                  widgets.add(
                      SearchMainCarousel(
                        height: 200,
                        width: 328,
                        restaurantList: data.nearByRestaurant.restaurantList,
                      )
                  );

                  // creating small size gallery
                  List<SearchMainGallery> restaurantContainers = [];
                  for (var i = 0; i < data.restaurantList.length; i++) {
                    List<RestaurantImage> imageContainer = [];
                    for (var j = 0; j <
                        data.restaurantList[i].restaurantList.length; j++) {
                      imageContainer.add(
                          RestaurantImage(
                              title: data.restaurantList[i].restaurantList[j]
                                  .title,
                              imgUrl: data.restaurantList[i].restaurantList[j]
                                  .imgUrl
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

class SearchMainCarousel extends StatelessWidget {
  final double height;
  final double width;
  final List<Restaurant> restaurantList;

  SearchMainCarousel({Key key,
    @required this.height,
    @required this.width,
    @required this.restaurantList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var isAutoPlay = false;
    var isInfiniteScroll = false;

    if(restaurantList.length > 1){
      isAutoPlay = true;
      isInfiniteScroll = true;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 24,
              right: 24,
              left: 24
          ),
          child: Text(
            LocalizationStrings.of(context)
                .getWithKey("home_search_near_location_title"),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CarouselSlider.builder(
          itemCount: restaurantList.length,
          itemBuilder: (BuildContext context, int itemIndex) =>
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 18,
                    ),
                    child: ImageLoader(
                      width: width,
                      height: height,
                      imgUrl: restaurantList[itemIndex].imgUrl,
                      fit: BoxFit.cover,
                      isUsingLoadIndicator: true,
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 0.25, 1.0],
                                colors: [Colors.transparent, Colors.black26, Colors.black38,]
                            )
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 12,
                            right: 12
                          ),
                          height: 96,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 8,
                                          bottom: 8
                                      ),
                                      child: Text(
                                        restaurantList[itemIndex].title,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: LetmeAppColor.onColors["primary"]
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Visibility(
                                      visible: restaurantList[itemIndex].title.isEmpty, // FIXME 値段などのこうもくをAPIが出来上がったら入力
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 4,
                                            bottom: 8
                                        ),
                                        child:  Text(
                                          restaurantList[itemIndex].title, // FIXME 値段などのこうもくをAPIが出来上がったら入力
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: LetmeAppColor.onColors["primary"]
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          options: CarouselOptions(
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            enableInfiniteScroll: isInfiniteScroll,
            autoPlay: isAutoPlay,
            autoPlayInterval: const Duration(seconds: 4)
          ),
        )
      ],
    );
  }
}
