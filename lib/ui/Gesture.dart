import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理"),
      ),
      body: Column(
        children: <Widget>[
          ClickTest(),
        ],
      ),
    );
  }
}

class ClickTest extends StatefulWidget {
  @override
  ClickTestState createState() {
    return ClickTestState();
  }
}

class ClickTestState extends State<ClickTest> {
  PointerEvent mEvent;

  @override
  Widget build(BuildContext context) {
    return /*Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300,
        height: 150,
        child: Text(
          mEvent?.toString()??"asfdasf",
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event)=>setState(()=>mEvent=event),
      onPointerMove: (PointerMoveEvent event)=>setState(()=>mEvent=event),
      onPointerUp: (PointerUpEvent event)=>setState(()=>mEvent=event),
    )*/
      /*Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue)),
            ),
            onPointerDown: (event) => print("down0"),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 100.0)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击")),
            ),
            onPointerDown: (event) => print("down1"),
            //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
          )
        ],
      )*/
      Listener(
        child: AbsorbPointer(//AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 200.0,
              height: 100.0,
            ),
            onPointerDown: (event)=>print("in"),
          ),
        ),
        onPointerDown: (event)=>print("up"),
      );
  }
}
