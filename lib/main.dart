import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/homepage.dart';
import 'package:flutter_wanandroid/knowledgepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _title="首页";
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    BottomNavigationBarItem item1=BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页"),backgroundColor: Colors.white);
    BottomNavigationBarItem item2=BottomNavigationBarItem(icon: Icon(Icons.apps),title: Text("知识体系"),backgroundColor: Colors.white);
    List<BottomNavigationBarItem> items=[item1,item2];
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(_title),
      ),
      body: new CupertinoTabScaffold(
        tabBar:new CupertinoTabBar(items: items,onTap:(index){
          if(index==0){
            setState(() {
              _title="首页";
            });
          }else if(index==1){
            setState(() {
              _title="知识体系";
            });
          }
          },) ,
        tabBuilder:(BuildContext context, int index){
          return new CupertinoTabView(builder: (mContext){
            if(index==0){
              return new HomePage(context);
            }else{
              return new KnowledgeWidget();
            }
          },);

        },


      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
