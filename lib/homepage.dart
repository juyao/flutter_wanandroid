import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(itemBuilder: (context,i){
      if(i==0){
        return new MyViewPager();
      }else{
        return Text("body");
      }
    });
  }
}

class MyViewPager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyVpState();
  
}
class MyVpState extends State<MyViewPager>{
  final PageController _pageController = new PageController();
  double _currentPage = 0.0;
  final List<Widget> _pages = <Widget>[
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(colors: Colors.blue),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(style: FlutterLogoStyle.stacked, colors: Colors.red),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
      physics: new AlwaysScrollableScrollPhysics(),
      controller: _pageController,
      itemBuilder: (context,index){
        return _pages[index % _pages.length];
    },itemCount: 5,scrollDirection: Axis.horizontal,);
  }
  
}
