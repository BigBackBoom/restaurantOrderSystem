import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_review_bloc.dart';
import 'package:letme_app/app/resources/models/home/store_reviews.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_review/organisms/store_detail_review_item.dart';
import 'package:provider/provider.dart';

class StoreDetailReview extends StatefulWidget {
  @override
  _StoreDetailReviewState createState() => _StoreDetailReviewState();
}

class _StoreDetailReviewState extends State<StoreDetailReview> {

  StoreDetailReviewBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = Provider.of<StoreDetailReviewBloc>(context);

    return StreamBuilder(
      stream: _bloc.storeRules,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          StoreReviewList reviewList = snapshot.data;

          return ListView.builder(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 100
            ),
            itemCount: reviewList.storeReviews.length,
            itemBuilder: (BuildContext context, int index) {
              return StoreDetailReviewItem(review:reviewList.storeReviews[index]);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
