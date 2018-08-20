import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wanandroid/bean/ArticleBean.dart';
import 'package:flutter_wanandroid/util/nativemethods.dart';
import 'package:flutter_wanandroid/util/netutils.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleList extends StatefulWidget{
  String cid;

  ArticleList(this.cid);

  @override
  State<StatefulWidget> createState() {
    return ArticleListState();
  }

}
class ArticleListState extends State<ArticleList>{
  List<ArticleBean> _articles=[];
  int currentPage=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticleList();
  }
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context,index){
      print("list:index=$index,length=${_articles.length}");
      if(index>=_articles.length-1){
        currentPage++;
        getArticleList();
      }
      return GestureDetector(child:new Card(margin:const EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 0.0),color: Colors.white,elevation: 10.0,child:
      new Container(padding: const EdgeInsets.all(10.0),child:
      new Column(children: <Widget>[
        new Container(margin: const EdgeInsets.only(bottom: 10.0),child: new Row(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
          CircleAvatar(radius: 15.0,backgroundImage:new NetworkImage("http://imgsrc.baidu.com/imgad/pic/item/42a98226cffc1e17d31927154090f603738de974.jpg"),),
          Expanded(child: Text(_articles[index].author,style: TextStyle(color: Colors.black87,fontSize: 14.0),),),
          Text(_articles[index].niceDate,style: TextStyle(color: Colors.grey,fontSize: 14.0),)
        ],),),
        new Container(margin: const EdgeInsets.only(bottom: 15.0),child: Text(_articles[index].title,style: TextStyle(color: Colors.black,fontSize: 16.0),),),
//        Text(_articles[index].chapterName,style: TextStyle(color: Colors.blue,fontSize: 14.0),)
      ],crossAxisAlignment: CrossAxisAlignment.start,)
        ,)
        ,) ,onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (context){
          return new WebviewScaffold(
            url: _articles[index].link,
            appBar: new AppBar(
              title: new Text(_articles[index].title,),
              actions: <Widget>[GestureDetector(child: Container(child: Center(child: Text("复制链接"),),padding: EdgeInsets.only(right: 10.0),),onTap:(){
                NativeMethods.copyToClipBoard(_articles[index].link);
              },)],
            ),
            withJavascript: true,
            withZoom: false,
          );
        }));
      },);
    },itemCount: _articles.length,);
  }
/**
 * 获取文章列表
 */
void getArticleList(){
    String url="http://www.wanandroid.com/article/list/$currentPage/json?cid=${widget.cid}";
    Netutils.get(url, (data){
          List d=data["datas"];
          List<ArticleBean> result=[];
          for(int i=0;i<d.length;i++){
            result.add(ArticleBean.fromJson(d[i]));
          }
          setState(() {
            if(currentPage==0){
              _articles=result;
            }else{
              _articles.addAll(result);
            }
          });
    });
}

}