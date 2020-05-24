import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {

  final String imgUrl;
  final bool isUsingLoadIndicator;
  final double width;
  final double height;
  final BoxFit fit;

  ImageLoader({Key key, @required this.imgUrl, this.width, this.height, this.isUsingLoadIndicator=false, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> placeholder= [];
    if(isUsingLoadIndicator){
      placeholder.add(
          Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator()
            ),
          )
      );
    }
    placeholder.add(
      Align(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/img/placeholder.png",
          width: width,
          height: height,
        )
    ));

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child:  CachedNetworkImage(
          fit: fit,
          imageUrl: imgUrl,
          height: height,
          width: width,
          placeholder: (context, url){
            return Stack(
                children: placeholder
            );
          },
        ),
      ),
    );
  }
}