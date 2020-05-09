import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:letme_app/app/widgets/screens/util/atoms/loading_img.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';

class StoreDetailReviewImageGallery extends StatelessWidget {

  final List<String> imageList;
  final double height;

  StoreDetailReviewImageGallery({Key key, @required this.height, @required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(imageList.length <= 0){
      return Container();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: ImageLoader(
              height: height,
              imgUrl: imageList[0],
              isUsingLoadIndicator: true,
              fit: BoxFit.cover,
            )
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Opacity(
                      opacity: imageList.length > 1 ? 1.0 : 0.0,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 4,
                            right: 4,
                            bottom: 4
                        ),
                        child: ImageLoader(
                          height: (height - 2) / 2,
                          imgUrl: imageList.length > 1 ? imageList[1] : "",
                          isUsingLoadIndicator: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: imageList.length > 2 ? 1.0 : 0.0,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 4,
                            right: 4,
                            bottom: 4
                        ),
                        child: ImageLoader(
                          height: (height - 2) / 2,
                          imgUrl: imageList.length > 2 ? imageList[2] : "",
                          isUsingLoadIndicator: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Opacity(
                      opacity: imageList.length > 3 ? 1.0 : 0.0,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 4,
                            right: 4,
                            bottom: 4
                        ),
                        child: ImageLoader(
                          height: (height - 2) / 2,
                          imgUrl: imageList.length > 3 ? imageList[3] : "",
                          isUsingLoadIndicator: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: imageList.length > 4 ? 1.0 : 0.0,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 4,
                            right: 4,
                            bottom: 4
                        ),
                        child: Text(
                            LocalizationStrings.of(context).getWithKey("order_detail_review_more"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}