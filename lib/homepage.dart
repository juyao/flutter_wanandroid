import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/BannerBean.dart';
import 'package:dio/dio.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(itemBuilder: (context,i){
      if(i==0){
        return new Container(child: MyViewPager(),width: double.maxFinite,height: 200.0,);
      }else{
        return new Card(margin:const EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 0.0),color: Colors.white,elevation: 10.0,child:
          new Container(padding: const EdgeInsets.all(10.0),child:
          new Column(children: <Widget>[
            new Container(margin: const EdgeInsets.only(bottom: 10.0),child: new Row(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
              CircleAvatar(radius: 15.0,backgroundImage:new NetworkImage("http://imgsrc.baidu.com/imgad/pic/item/42a98226cffc1e17d31927154090f603738de974.jpg"),),
              Expanded(child: Text("作者名字",style: TextStyle(color: Colors.black87,fontSize: 14.0),),),
              Text("日期",style: TextStyle(color: Colors.grey,fontSize: 14.0),)
            ],),),
            new Container(margin: const EdgeInsets.only(bottom: 15.0),child: Text("这里是文章标题",style: TextStyle(color: Colors.black,fontSize: 16.0),),),
            Text("文章分类",style: TextStyle(color: Colors.blue,fontSize: 14.0),)

          ],crossAxisAlignment: CrossAxisAlignment.start,)
            ,)
          ,);
      }
    },itemCount: 5,);

  }
}

class MyViewPager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyVpState();
  
}
class MyVpState extends State<MyViewPager>{
  List<BannerBean> _banners=[];
  String bannerUrl="http://www.wanandroid.com/banner/json";
  final PageController _pageController = new PageController();
  double _currentPage = 0.0;
  @override
  void initState(){
    super.initState();
    getBannerInfo();
  }
  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
      physics: new AlwaysScrollableScrollPhysics(),
      controller: _pageController,
      itemBuilder: (context,index){
        return Stack(children: <Widget>[
          new Image.network(_banners[index].imagePath,width: double.maxFinite,fit: BoxFit.fill,),
          new Positioned(child: new Container(child: new Text(_banners[index].title,
            style: TextStyle(color: Colors.white,fontSize: 18.0,),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,),
            padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
            decoration: BoxDecoration(color: const Color(0x80000000)),) ,bottom: 0.0,left: 0.0,right: 0.0,),
        ],);
    },itemCount: _banners.length,scrollDirection: Axis.horizontal,);
  }
/**
 * 请求banner数据
 */
Future getBannerInfo() async {
  Dio dio = new Dio();
  Response response=await dio.get(bannerUrl);
  Map<String, dynamic>  jsonResult = response.data;
  if(jsonResult["errorCode"]==0){
    List data=jsonResult["data"];
    List<BannerBean> result=[];
    for(var i=0;i<data.length;i++){
      result.add(BannerBean.fromJson(data[i]));
    }
    setState(() {
      _banners=result;
    });
    
  }
}

}
