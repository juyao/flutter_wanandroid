import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/Knowledge.dart';
import 'package:flutter_wanandroid/widgets/articlelist.dart';

class TypeDetail extends StatelessWidget{
  Knowledge _knowledge;

  TypeDetail(this._knowledge);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Tab> tabs=[];
    for(int i=0;i<_knowledge.children.length;i++){
      tabs.add(new Tab(text: _knowledge.children[i].name,));
    }
    return new DefaultTabController(length: tabs.length,
      child: new Scaffold(appBar: AppBar(title: new Text(_knowledge.name),bottom: new TabBar(tabs:tabs,isScrollable: true,),),
      body: new TabBarView(children: _knowledge.children.map((Children child){
        return new ArticleList("${child.id}");
      }).toList()),),);

  }

}
