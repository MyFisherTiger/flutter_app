import 'package:flutter/material.dart';

class test1 extends StatelessWidget {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TapBoxA(),
            //ParentWidget(),
            /* Text(
              "affaflajfljkfljafafasfdasfsfafaasfsdfsadfadsafsf",
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14.0,
                background: new Paint()..color = Colors.grey[200],
                decoration: TextDecoration.underline,
              ),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "6666"),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
              )
            ])),
            RaisedButton(
              onPressed: () {},
              child: Text("raise"),
            ),
            FlatButton(onPressed: () {}, child: Text("flat")),
            OutlineButton(
              onPressed: () {},
              child: Text("Outline"),
            ),
            IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("afdf"),
              onPressed: () {},
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),*/
            Image(
              image: AssetImage("images/dog.jpg"),
              width: 100.0,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
              height: 50.0,
              repeat: ImageRepeat.repeatX,
              fit: BoxFit.cover,
            ),
            Switch(
              value: isCheck,
              onChanged: (value) {
                isCheck = value;
                print("状态" + value.toString());
              },
            ),
            TextField(
              autofocus: false,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              onChanged: (v) {
                print("change" + v.toString());
              },
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: 0.2,
            ),
            SizedBox(
              width: 100,
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.2,
              ),
            ),
            ProgressView(),
          ],
        ),
      ),
    );
  }
}

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  _TapBoxAState createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool isActive = false;

  void handleTap() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: Container(
        child: Center(
          child: Text(
            isActive ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: isActive ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  ParentWidgetSate createState() => new ParentWidgetSate();
}

class ParentWidgetSate extends State<ParentWidget> {
  bool _active = false;

  void handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
      print("父类获取的按压状态" + _active.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapBoxB(
        active: _active,
        onChanged: handleTapBoxChanged,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: handleTap,
        child: new Container(
          child: new Center(
            child: new Text(
              active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ));
  }
}

class ProgressView extends StatefulWidget {
  @override
  ProgressViewState createState() => new ProgressViewState();
}

class ProgressViewState extends State<ProgressView>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller.forward();
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                    .animate(controller),
                value: controller.value,
              )),
        ],
      ),
    );
  }
}
