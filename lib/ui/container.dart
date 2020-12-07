import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("container"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green[100],
            padding: EdgeInsets.all(15),
            child: Text(
              "fasff",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            color: Colors.red[100],
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              "fasff",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            color: Colors.blue[100],
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              "fasff",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            color: Colors.yellow[100],
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "fasff",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 50.0,
              minWidth: 50,
            ),
            child: Container(
              height: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),

          //多重限制,min选最大的，max选最小的
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90, minHeight: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 10, minHeight: 90),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),
          //多重限制，去除父对子的限制
          Container(
            color: Colors.green[200],
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90, minHeight: 20),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 10, minHeight: 90),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),

          //宽高比
          Container(
            width: 200,
            child: AspectRatio(
              aspectRatio: 4 / 1,
              child: Container(
                color: Colors.blue[400],
              ),
            ),
          ),

          DecoratedBox(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
              child: Text(
                "login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          Container(
            color: Colors.black,
            child: new Transform(
              transform: new Matrix4.skew(0.2, 0.3),
              alignment: Alignment.topRight,
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.orange,
                child: const Text('fsaffa;falfajdfalfa;falfj'),
              ),
            ),
          ),

          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.translate(
              offset: Offset(5, 5),
              child: Text("asflksadjfl"),
            ),
          ),

          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.rotate(
              angle: 180,
              child: Text("asflksadjfl"),
            ),
          ),

          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(
              scale: 1.5,
              child: Text("asflksadjfl"),
            ),
          ),

          //layout阶段就能变换的
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[500],
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text("afdfasdf"),
            ),
          ),

          Container(
            margin: EdgeInsets.all(20.0), //容器外补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
          Container(
            padding: EdgeInsets.all(20.0), //容器内补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
        ],
      ),
    );
  }
}
