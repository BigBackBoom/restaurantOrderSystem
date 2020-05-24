import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/util/atoms/loading_img.dart';

typedef OnTapCallback = void Function(int id);

class SearchMainGallery extends StatelessWidget {
  final String categoryName;
  final List<RestaurantImage> imgList;
  final double imageHeight;
  final double imageWidth;
  final EdgeInsets titleMargin;
  final EdgeInsets galleryPadding;
  final OnTapCallback callback;

  SearchMainGallery(
      {Key key,
      this.categoryName,
      @required this.imgList,
      @required this.imageHeight,
      @required this.imageWidth,
      this.titleMargin,
      this.galleryPadding,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: titleMargin,
          child: Text(categoryName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.start),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
              itemCount: imgList.length,
              padding: galleryPadding,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => callback(imgList[index].id),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        child: ImageLoader(
                          width: imageWidth,
                          height: imageHeight,
                          imgUrl: imgList[index].imgUrl,
                          fit: BoxFit.cover,
                          isUsingLoadIndicator: true,
                        ),
                      ),
                      Positioned(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            padding: EdgeInsets.only(
                                top: 4,
                                left: 8,
                                right: 8,
                                bottom: 4
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.0, 0.25, 1.0],
                                    colors: [Colors.transparent, Colors.black26, Colors.black38,]
                                )
                            ),
                            width: imageWidth,
                            child: Text(
                              imgList[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: LetmeAppColor.onColors["primary"]),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}

class RestaurantImage extends StatelessWidget {
  final int id;
  final String title;
  final String imgUrl;

  RestaurantImage({Key key, this.id, this.title, @required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {}
}
