import 'package:flutter/services.dart';

class NativeMethods{
  static const platform = const MethodChannel('top.dodeman/wanandroid');
  /**
   * 复制到粘贴板
   */
 static copyToClipBoard(String str){
    platform.invokeMethod("copyToClipBoard",{'message':str});
  }

}