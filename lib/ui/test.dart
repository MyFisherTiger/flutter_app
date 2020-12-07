import 'package:flutter/material.dart';

class NewRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是第二个页面"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            Navigator.of(context).pushNamed("jump_with_data_router",arguments: "==>这里传递的参数");
            // 打开`TipRoute`，并等待返回结果
            /*var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return JumpWithData(
                    // 路由参数
                    text: "我是提示xxxx",
                  );
                },
              ),
            );
            //输出`TipRoute`路由返回结果
            print("路由返回值: $result");*/
          },
          child: Text("打开提示页"),
        ),
      ),
    );
  }
}

//with data jump
class JumpWithData extends StatelessWidget {
  final String text;

  JumpWithData({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tips"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("" + text+args),
              RaisedButton(
                onPressed: () =>
                    Navigator.pop(context, "I am the return value"),
                child: Text("go back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
