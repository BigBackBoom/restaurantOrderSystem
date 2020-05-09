import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_bloc.dart';
import 'package:letme_app/app/resources/models/home/store_detail.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_top/molecules/store_detail_top_about.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_top/molecules/store_detail_top_header.dart';
import 'package:letme_app/app/widgets/screens/util/molecules/title_text.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';
import 'package:provider/provider.dart';

class StoreDetailTop extends StatefulWidget {
  @override
  _StoreDetailTopState createState() => _StoreDetailTopState();
}

class _StoreDetailTopState extends State<StoreDetailTop> {
  StoreDetailBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = Provider.of<StoreDetailBloc>(context);

    return StreamBuilder(
      stream: _bloc.storeDetail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          StoreDetail store = snapshot.data;
          return Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        "https://parkfront-hotel.com/assets/img/restaurant/index/kv01.jpg",
                        height: 248,
                        fit: BoxFit.fill,
                      ),
                      color: Colors.black,
                    ),
                    Container(
                        padding: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 16,
                          bottom: 100,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  StoreDetailTopHeader(name: store.name, address: "test"),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 16
                                    ),
                                    child: TitleTextWidget(
                                        title: LocalizationStrings.of(context).getWithKey("order_detail_seat_availability_label"),
                                        description: "More thna half vacant"
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 16
                                    ),
                                    child: StoreDetailTopAbout(),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 16
                                    ),
                                    child: TitleTextWidget(
                                        title: LocalizationStrings.of(context).getWithKey("order_detail_manner_fee_label"),
                                        description: "1.  The table charge is 300 yen, but one fixed service menu will be served.  This system is very popular in Japan,  called “OTOSHI”. \n2.  Please do not shout, smoke, and tap the table.  Thank you for your cooperation."
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
            ],
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
