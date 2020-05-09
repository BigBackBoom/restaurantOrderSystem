import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/resources/models/home/store_reviews.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_review/molecules/store_detail_review_image_gallery.dart';
import 'package:letme_app/app/widgets/screens/util/atoms/loading_img.dart';

class StoreDetailReviewItem extends StatelessWidget {

  final Review review;

  StoreDetailReviewItem({Key key, @required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
        top: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: LetmeAppColor.border,
              width: 1,
          )
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        review.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          review.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                ImageLoader(
                  width: 60,
                  height: 60,
                  imgUrl: review.userImg,
                  isUsingLoadIndicator: true,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: 8,
              ),
              child: Column(
                children: <Widget>[
                  StoreDetailReviewImageGallery(
                    height: 86,
                    imageList: review.reviewImg,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}