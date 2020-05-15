import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:letme_app/app/widgets/screens/util/atoms/loading_img.dart';

class StoreDetailMenuGallery extends StatelessWidget {
  final String title;
  final List<String> imgList;
  final double imageHeight;
  final EdgeInsets titleMargin;
  final EdgeInsets galleryPadding;

  StoreDetailMenuGallery(
      {Key key,
      @required this.title,
      @required this.imgList,
      @required this.imageHeight,
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
          child: Text(title,
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
                return Container(
                  margin: EdgeInsets.only(
                      left: 8,
                      right: 8
                  ),
                  child: ImageLoader(
                    imgUrl: imgList[index],
                    isUsingLoadIndicator: true,
                  ),
                );
              }),
        )
      ],
    );
  }
}
