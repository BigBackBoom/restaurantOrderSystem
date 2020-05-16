import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/util/atoms/loading_img.dart';

class SearchMainGallery extends StatelessWidget {
  final String categoryName;
  final List<RestaurantImage> imgList;
  final double imageHeight;
  final double imageWidth;
  final EdgeInsets titleMargin;
  final EdgeInsets galleryPadding;

  SearchMainGallery(
      {Key key,
      this.categoryName,
      @required this.imgList,
      @required this.imageHeight,
      @required this.imageWidth,
      this.titleMargin,
      this.galleryPadding})
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
                return Stack(
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

                          color: Colors.black54,
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
                );
              }),
        )
      ],
    );
  }
}

class RestaurantImage extends StatelessWidget {
  final String title;
  final String imgUrl;

  RestaurantImage({Key key, this.title, @required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {}
}
