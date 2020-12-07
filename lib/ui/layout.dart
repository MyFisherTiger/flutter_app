import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("layout"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("nihao"),
              Text("afadsfasfdasf"),
            ],
          ),
          FlexLayoutTestRoute(),
        ],
      ),
    );
  }
}

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color: Colors.red,
                )),
            Expanded(
              flex: 3,
              child: Container(
                height: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 100.0,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A'),
              ),
              label: new Text("Hamilton"),
            ),
            new Chip(
              avatar: new CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('B'),
              ),
              label: new Text("Hamilton"),
            ),
            new Chip(
              avatar: new CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('C'),
              ),
              label: new Text("Hamilton"),
            ),
            new Chip(
              avatar: new CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('D'),
              ),
              label: new Text("Hamilton"),
            ),
            new Chip(
              avatar: new CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('E'),
              ),
              label: new Text("Hamilton"),
            ),
          ],
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                Container(
                  child: Text(
                    "hello stack",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
                Positioned(
                  child: Text("I am jack"),
                  left: 18.0,
                ),
                Positioned(
                  top: 18.0,
                  child: Text("I m rose"),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 120,
          width: 120,
          color: Colors.blue[50],
          child: Align(
            /*heightFactor: 1.5,
            widthFactor: 1.5,*/
            //alignment: Alignment(1,0),
            alignment: FractionalOffset(0.5,0.5),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
      ],
    );
  }
}
