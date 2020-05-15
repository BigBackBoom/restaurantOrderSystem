import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_menu_bloc.dart';
import 'package:letme_app/app/resources/models/home/store_menu.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_menu/molecules/store_detail_menu_gallery.dart';
import 'package:provider/provider.dart';

class StoreDetailMenu extends StatefulWidget {
  @override
  _StoreDetailMenuState createState() => _StoreDetailMenuState();
}

class _StoreDetailMenuState extends State<StoreDetailMenu> {

  StoreDetailMenuBloc _bloc;

  @override
  Widget build(BuildContext context) {

    _bloc = Provider.of<StoreDetailMenuBloc>(context);

    return StreamBuilder(
        stream: _bloc.storeMenuList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            StoreMenuList menuList = snapshot.data;

            List<String> tempImgList = [];
            List<String> catList = [];
            for (var i = 0; i < menuList.storeMenuList.length; i++) {
              catList.add(menuList.storeMenuList[i].categoryName);
              for (var j = 0; j < menuList.storeMenuList[i].menu.length; j++) {
                tempImgList.add(menuList.storeMenuList[i].menu[j].imgUrl);
              }
            }
            // mock
            List<Widget> mock = [
              Container(
                margin: EdgeInsets.only(
                  top: 12,
                  left: 24,
                ),
                child: DropdownButton<String>(
                  value: catList[0],
                  onChanged: (String newValue) {
                    setState(() {

                    });
                  },
                  items: catList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              StoreDetailMenuGallery(
                title: "Food",
                imgList: <String>[
                  "https://hips.hearstapps.com/hmg-prod/images/20190503-delish-pineapple-baked-salmon-horizontal-ehg-450-1557771120.jpg",
                  "https://smilefoodproject.com/wp-content/uploads/2020/04/sfp_8_001.jpg",
                  "https://m.economictimes.com/thumb/msid-72299767,width-1200,height-900,resizemode-4,imgsize-365179/indian-food-bccl.jpg",
                  "https://previews.123rf.com/images/zukamilov/zukamilov1906/zukamilov190600100/124852049-traditional-turkish-cuisine-turkish-pizza-pita-with-a-different-stuffing-meat-cheese-slices-of-veal-.jpg"
                ],
                imageHeight: 80,
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
              ),
              StoreDetailMenuGallery(
                title: "Appetizer",
                imgList: <String>[
                  "https://hips.hearstapps.com/hmg-prod/images/20190503-delish-pineapple-baked-salmon-horizontal-ehg-450-1557771120.jpg",
                  "https://smilefoodproject.com/wp-content/uploads/2020/04/sfp_8_001.jpg",
                  "https://m.economictimes.com/thumb/msid-72299767,width-1200,height-900,resizemode-4,imgsize-365179/indian-food-bccl.jpg",
                  "https://previews.123rf.com/images/zukamilov/zukamilov1906/zukamilov190600100/124852049-traditional-turkish-cuisine-turkish-pizza-pita-with-a-different-stuffing-meat-cheese-slices-of-veal-.jpg"
                ],
                imageHeight: 80,
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
            ];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: mock,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}
