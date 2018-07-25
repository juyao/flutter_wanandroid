import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/ArticleBean.dart';
import 'package:flutter_wanandroid/bean/BannerBean.dart';
import 'package:dio/dio.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  List<BannerBean> _banners=[];
  List<ArticleBean> _articles=[];
  int _currentPage=0;
  String bannerUrl="http://www.wanandroid.com/banner/json";
  Dio dio;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dio = new Dio();
    getBannerInfo();
    getArticleInfo();
  }
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context,i){
      if(i==0){
        return new Container(child: MyViewPager(_banners),width: double.maxFinite,height: 200.0,);
      }else{
        return new Card(margin:const EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 0.0),color: Colors.white,elevation: 10.0,child:
        new Container(padding: const EdgeInsets.all(10.0),child:
        new Column(children: <Widget>[
          new Container(margin: const EdgeInsets.only(bottom: 10.0),child: new Row(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
            CircleAvatar(radius: 15.0,backgroundImage:new NetworkImage("http://imgsrc.baidu.com/imgad/pic/item/42a98226cffc1e17d31927154090f603738de974.jpg"),),
            Expanded(child: Text(_articles[i].author,style: TextStyle(color: Colors.black87,fontSize: 14.0),),),
            Text(_articles[i].niceDate,style: TextStyle(color: Colors.grey,fontSize: 14.0),)
          ],),),
          new Container(margin: const EdgeInsets.only(bottom: 15.0),child: Text(_articles[i].title,style: TextStyle(color: Colors.black,fontSize: 16.0),),),
          Text(_articles[i].chapterName,style: TextStyle(color: Colors.blue,fontSize: 14.0),)
        ],crossAxisAlignment: CrossAxisAlignment.start,)
          ,)
          ,);
      }
    },itemCount: _articles.length,);
  }
  /**
   * 请求banner数据
   */
  Future getBannerInfo() async {
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
  getArticleInfo()async {
    var articleUrl="http://www.wanandroid.com/article/list/$_currentPage/json";
    Response response=await dio.get(articleUrl);
    Map<String, dynamic>  jsonResult = response.data;
    if(jsonResult["errorCode"]==0){
      List data=jsonResult["data"]["datas"];
      List<ArticleBean> result=[];
      for(var i=0;i<data.length;i++){
        result.add(ArticleBean.fromJson(data[i]));
      }
      setState(() {
          _articles=result;
      });
    }

  }

}

class MyViewPager extends StatelessWidget{
  List<BannerBean> _banners;
  final PageController _pageController = new PageController();
  MyViewPager(this._banners);
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

  
}

