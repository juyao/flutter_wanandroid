import 'dart:async';

import 'package:dio/dio.dart';

class Netutils{
    static Dio dio;
    static Dio getDio(){
        if(dio==null){
            dio=Dio();
        }
        return dio;
    }
    static Future get(String url,Function callBack)async {
        Response response=await getDio().get(url);
        Map<String, dynamic>  jsonResult = response.data;
        if(jsonResult["errorCode"]==0){
            callBack(jsonResult["data"]);
        }
    }

}