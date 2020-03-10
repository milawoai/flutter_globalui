import 'package:flutter/material.dart';
import 'package:globalui/globalui.dart'; // 1. import library
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GuiWrapper(
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    //showToast("tast");
    showCancelModal(
        title: "测试标题",
        msg: "测试消息",
        onCancelPressed: () {
          print("showCancelModal");
        });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              color: getRandomColor(),
              onPressed: () {
                showToast("tast");
              },
              child: Text("Toast",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
            ),
            FlatButton(
               color: getRandomColor(),
              onPressed: () {
                showCancelModal(
                    title: "测试标题",
                    msg: "测试消息",
                    onCancelPressed: () {
                      print("showCancelModal");
                    });
              },
              child: Text("one button modal",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
            ),
            FlatButton(
               color: getRandomColor(),
               onPressed: () {
                showCancelConfirmModal(
                    title: "testTitle",
                    msg: "测试消息",
                    cancelText: "BYE",
                    onCancelPressed: () {
                      print("click cancel");
                    },
                    confirmText: "Hi",
                    confirmTextStyle: TextStyle(color: Colors.white, fontSize: 15.0),
                    confirmBackgroundColor: Colors.red,
                    onConfirmPressed: () {
                      print("click confirm");
                    },
                  );
                    
              },
              child: Text("two button modal",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  }
}
