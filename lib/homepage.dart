import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/ArticleBean.dart';
import 'package:flutter_wanandroid/bean/BannerBean.dart';
import 'package:dio/dio.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class HomePage extends StatefulWidget{
  BuildContext mainContext;

  HomePage(this.mainContext);

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
      print("i=$i,_articles.length=${_articles.length}");
      if(i>=_articles.length-1){
        _currentPage++;
        getArticleInfo();
      }
      if(i==0){
        return new Container(child: MyViewPager(_banners,widget.mainContext),width: double.maxFinite,height: 200.0,);
      }else{
          return GestureDetector(child:new Card(margin:const EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 0.0),color: Colors.white,elevation: 10.0,child:
          new Container(padding: const EdgeInsets.all(10.0),child:
          new Column(children: <Widget>[
            new Container(margin: const EdgeInsets.only(bottom: 10.0),child: new Row(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
              CircleAvatar(radius: 15.0,backgroundImage:new NetworkImage("http://imgsrc.baidu.com/imgad/pic/item/42a98226cffc1e17d31927154090f603738de974.jpg"),),
              Expanded(child: Text(_articles[i-1].author,style: TextStyle(color: Colors.black87,fontSize: 14.0),),),
              Text(_articles[i-1].niceDate,style: TextStyle(color: Colors.grey,fontSize: 14.0),)
            ],),),
            new Container(margin: const EdgeInsets.only(bottom: 15.0),child: Text(_articles[i-1].title,style: TextStyle(color: Colors.black,fontSize: 16.0),),),
            Text(_articles[i-1].chapterName,style: TextStyle(color: Colors.blue,fontSize: 14.0),)
          ],crossAxisAlignment: CrossAxisAlignment.start,)
            ,)
            ,) ,onTap: (){
            Navigator.of(widget.mainContext).push(new MaterialPageRoute(builder: (context){
              return new WebviewScaffold(
                url: _articles[i-1].link,
                appBar: new AppBar(
                  title: new Text(_articles[i-1].title,),
                ),
                withJavascript: true,
                withZoom: false,
              );
            }));
          },);
      }
    },itemCount: _articles.length,shrinkWrap: true,);
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
        if(_currentPage==0){
          _articles=result;
        }else{
          _articles.addAll(result);
        }

      });
    }

  }

}

class MyViewPager extends StatelessWidget{
  List<BannerBean> _banners;
  BuildContext mainContext;
  final PageController _pageController = new PageController();

  MyViewPager(this._banners, this.mainContext);

  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
      physics: new AlwaysScrollableScrollPhysics(),
      controller: _pageController,
      itemBuilder: (context,index){
        return GestureDetector(child: Stack(children: <Widget>[
          new Image.network(_banners[index].imagePath,width: double.maxFinite,fit: BoxFit.fill,),
          new Positioned(child: new Container(child: new Text(_banners[index].title,
            style: TextStyle(color: Colors.white,fontSize: 18.0,),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,),
            padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
            decoration: BoxDecoration(color: const Color(0x80000000)),) ,bottom: 0.0,left: 0.0,right: 0.0,),
        ],),onTap: (){
          Navigator.of(mainContext).push(new MaterialPageRoute(builder: (context){
            return new WebviewScaffold(
              url: _banners[index].url,
              appBar: new AppBar(
                title: new Text(_banners[index].title,),
              ),
              withJavascript: true,
              withZoom: false,
            );
          }));
        },);
      },itemCount: _banners.length,scrollDirection: Axis.horizontal,);
  }

  
}

