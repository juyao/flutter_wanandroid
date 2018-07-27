import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/Knowledge.dart';
class KnowledgeWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return KnowledeState();
  }

}
class KnowledeState extends State<KnowledgeWidget>{
  List<Knowledge> _knowledges=[];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context,index){
        List<Widget> widgets=[];
        for(int i=0;i<50;i++){
          widgets.add(Text("test"));
        }
        return GestureDetector(child: new Card(margin: const EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 0.0),
          color: Colors.white,
          elevation: 10.0,
          child: new Container(padding: const EdgeInsets.all(10.0),child: new Row(children: <Widget>[new Expanded(child: new Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[Text("这是标题",style: TextStyle(color: Colors.black,fontSize: 18.0),),new Container(width: double.maxFinite,height:40.0,child: new Flow(delegate: MyFlowDelegate(padding: 0.0),children: widgets,),)],)),Icon(Icons.keyboard_arrow_right)],
            crossAxisAlignment: CrossAxisAlignment.center,),)
          ,),);
    },itemCount: 10,);
  }

}


class MyFlowDelegate extends FlowDelegate {
  double padding = 0.0;

  MyFlowDelegate({this.padding});
  @override
  void paintChildren(FlowPaintingContext context) {
    var tempWidth = 0.0;
    var tempHeight = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + tempWidth + padding;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                tempWidth + padding, tempHeight, 0.0));
        tempWidth = w;
      } else {
        tempWidth = 0.0;
        tempHeight += context.getChildSize(i).height + padding;
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                tempWidth + padding, tempHeight, 0.0));
        tempWidth += context.getChildSize(i).width + padding;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints){
    BoxConstraints boxConstraints = new BoxConstraints(maxHeight: constraints.maxHeight,maxWidth: constraints.maxWidth);
    return boxConstraints;
  }
}