import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/dog.jpg", width: 60.0);
    return
        //CustomScrollViewTestRoute()
        //ScrollControllerTest()
        ScrollNotificationTest()
        /*Scaffold(
      appBar: AppBar(
        title: Text('others'),
      ),
      body:
          //SingleChildScrollViewTestRoute(),
          List2(),
    )*/
        ;
  }
}

class ScrollNotificationTest extends StatefulWidget {
  @override
  ScrollNotificationTestState createState() {
    return ScrollNotificationTestState();
  }
}

class ScrollNotificationTestState extends State<ScrollNotificationTest> {
  String mProgress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scroll control2"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              mProgress = "${(progress * 100).toInt()}";
            });
            print("BottomEdge:${notification.metrics.extentAfter == 0}");
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("$index"));
                  }),
              CircleAvatar(
                radius: 30,
                child: Text(mProgress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollControllerTest extends StatefulWidget {
  @override
  ScrollControllerTestState createState() {
    return new ScrollControllerTestState();
  }
}

class ScrollControllerTestState extends State<ScrollControllerTest> {
  ScrollController mController = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    mController.addListener(() {
      print(mController.offset);
      if (mController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (mController.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    mController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50,
            controller: mController,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
              );
            }),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(onPressed: () {
              mController.animateTo(0,
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            }),
    );
  }
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      // 显示进度条
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str
                .split("")
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class List1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.red,
    );

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("$index item"),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 1 ? divider2 : divider;
      },
      itemCount: 100,
    );
  }
}

class List2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.red,
    );

    return Column(
      children: <Widget>[
        ListTile(
          title: Text("商品列表"),
        ),
        SizedBox(
          height: 500,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //maxCrossAxisExtent: 120,
                crossAxisCount: 3,
                childAspectRatio: 2.0),
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index item"),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 1 ? divider2 : divider;
            },
            itemCount: 100,
          ),
        ),
      ],
    );
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "./images/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );
  }
}
