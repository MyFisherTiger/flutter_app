import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OthersLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/dog.jpg", width: 60.0);
    return Scaffold(
      appBar: AppBar(
        title: Text('others'),
      ),
      body: Column(
        children: <Widget>[
          avatar,
          ClipOval(
            child: avatar,
          ),
          ClipRRect(
            child: avatar,
            borderRadius: BorderRadius.circular(15.0),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.topLeft,
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: avatar,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: ClipRect(
                clipper: MyClipper(), //使用自定义的clipper
                child: avatar),
          ),
          ClipRect(
              clipper: MyClipper(), //使用自定义的clipper
              child: avatar),


        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(10, 15, 40, 30);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}


