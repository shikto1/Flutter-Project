import 'dart:convert';
import 'package:blockpatter/data/network/APIs.dart';
import 'package:blockpatter/data/network/ApiResponse.dart';
import 'package:blockpatter/data/network/DioUtils.dart';
import 'package:blockpatter/models/PostResponse.dart';
import 'package:blockpatter/utils/AppUtils.dart';
import 'package:dio/dio.dart';
import 'package:blockpatter/data/network/ConnectivityUtils.dart';

class LoginRepository {

//  Future<PostResponse> doLogin(String url) async {
//    try {
//      Response response = await DioUtils.getInstance().get(url);
//    //  ItemModel itemModel = ItemModel.fromJson(response.data);
//     // print("Name: ${itemModel.name}\nAge: ${itemModel.age}");
//   //   List responseJson = json.decode(response.data);
//     // print(response.data);
//    //  return responseJson.map((m) => new Post.fromJson(m)).toList();
//      return PostResponse.formJson(response.data);
//    } on DioError catch (e) {
//
//      if (e.type == DioErrorType.DEFAULT && e.error == NoConnectivityException) {
//        print("<<<<<<<No Network Connectivity......!!");
//      } else if (e.type == DioErrorType.RESPONSE) {
//        Response _response = e.response;
//        if (_response != null) {
//          int _httpCode = _response.statusCode;
//          print("HTTP CODE: $_httpCode");
//          switch (_httpCode) {
//            case 401:
//              {
//                break;
//              }
//            case 404:
//              {
//                break;
//              }
//            case 500:
//              {
//                break;
//              }
//            case 422:
//              {
//                break;
//              }
//          }
//        }
//      } else if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
//        print("<<<<<<<Connect or Receive Time out.... !!");
//      }
//      return PostResponse.empty();
//     // return ItemModel.fromError("Error Found");
//    }
//  }
}
