import 'dart:async';

import 'package:dio/dio.dart';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class HttpUtils {
  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = 'http://192.168.1.111:8080';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;
  static const Map<String, dynamic> HEADERS = {'Content-Type': 'application/json'};

  /// request method
  static Future request(String url, {data, method}) async {
    data = data ?? {};
    method = method ?? 'GET';

    /// restful 请求处理
    /// 打印请求相关信息：请求地址、请求方式、请求参数

    Dio dio = createInstance();
    _httpInterceptor(dio);
    var result;

    try {
      Response response;
      if (method == GET) {
        if (data != null && data.isNotEmpty) {
          response = await dio.get(url, queryParameters: data);
        } else {
          response = await dio.get(url);
        }
      } else if (method == POST) {
        if (data != null && data.isNotEmpty) {
          response = await dio.post(url, data: data);
        } else {
          response = await dio.post(url);
        }
      }
      result = response.data;

      /// 打印响应相关信息
//      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      print('请求出错：' + e.toString());
    }
    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(baseUrl: API_PREFIX, connectTimeout: CONNECT_TIMEOUT, receiveTimeout: RECEIVE_TIMEOUT, headers: HEADERS);
      dio = new Dio(options);
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  static _httpInterceptor(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // 在请求被发送之前做一些事情
      Map<String, dynamic> headers = options.headers;

      /// 获取 token
      headers['token'] = '1111111111';
      return options; //continue
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (Response response) {
      // 在返回响应数据之前做一些预处理
      return response; // continue
    }, onError: (DioError e) {
      // 当请求失败时做一些预处理
      return e; //continue
    }));
  }
}
