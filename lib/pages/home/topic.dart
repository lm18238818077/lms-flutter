import 'package:flutter/material.dart';
import 'package:lms_flutter/utils/rem.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Topic extends StatelessWidget {
  final List data;
  final BuildContext contexts;
  Topic(this.data, this.contexts);
  final String title = '专题精选';
  Widget swiper(List imgList) {
    return Container(
      width: double.infinity,
      height: Rem.getPxToRem(480),
      child: Swiper(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: Rem.getPxToRem(400),
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: imgList[index]['scene_pic_url'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: Rem.getPxToRem(40),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: imgList[index]['title'],
                              style: TextStyle(
                                  fontSize: Rem.getPxToRem(26),
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: '￥${imgList[index]['price_info']}元起',
                            style: TextStyle(
                              color: Colors.red[600],
                              fontSize: Rem.getPxToRem(26),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]))),
                  ),
                  Container(
                    height: Rem.getPxToRem(40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        imgList[index]['subtitle'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: Rem.getPxToRem(22), color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ));
        },
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        onTap: (index) {
          Navigator.pushNamed(
            contexts,
            '/topicDetail',
            arguments: {'id': imgList[index]['id']},
          );
        },
        viewportFraction: 0.8,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List imgUrl = [];
    data.forEach((item) => imgUrl.add(item));
    return Container(
      margin: EdgeInsets.only(top: Rem.getPxToRem(20)),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: Rem.getPxToRem(100),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                    fontSize: Rem.getPxToRem(30)),
              ),
            ),
          ),
          swiper(imgUrl),
        ],
      ),
    );
  }
}
