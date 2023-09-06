import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioUtil {
  static DioUtil? _instance;
  late Dio _dio;
  static const String _BASEURL = "___";
  static const int _CONNECTTIMEOUT = 2000;
  static const int _RECEIVETIMEOUT = 2000;

  factory DioUtil() {
    if (_instance == null) {
      _instance = DioUtil._internal();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  DioUtil._internal() {
    var options = BaseOptions(
      baseUrl: _BASEURL,
      //连接时间
      connectTimeout: _CONNECTTIMEOUT,
      //响应时间
      receiveTimeout: _RECEIVETIMEOUT,
      //设置请求头
      // headers: {"contentType": "application/json"},
      //默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      // contentType: "application/json",
      //共有三种方式json,bytes(响应字节),stream（响应流）,plain
      // responseType: ResponseType.json
    );
    _dio = Dio(options);
    //设置Cookie
    // _dio.interceptors.add(CookieManager(CookieJar()));
    // _dio.interceptors.add(CookieManager(PersistCookieJar()));
    // //添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint("请求 --- ${options.headers}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint("接收 --- $response");
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        debugPrint("错误 --- $e");
        // todo
        return handler.next(e);
      },
    ));
  } //private constructor

  Future<Response?> get(String url,
      {Map<String, dynamic>? map, Options? options}) async {
    try {
      Response response =
          await _dio.get(url, queryParameters: map, options: options);
      return response;
    } on DioError catch (e) {
      formatError(e);
    }
    return null;
  }

  Future<Response?> post(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? query,
      Options? options}) async {
    try {
      return _dio.post(url,
          data: data, queryParameters: query, options: options);
    } on DioError catch (e) {
      formatError(e);
    }
    return null;
  }

  Future<Response?> postForm(String url, Map<String, dynamic> map) async {
    try {
      FormData formData = FormData.fromMap(map);
      return await _dio.post(url,
          data: formData, options: Options(contentType: "multipart/form-data"));
    } on DioError catch (e) {
      formatError(e);
    }
    return null;
  }

  Future<Response?> put(String url,
      {required Map<String, dynamic> map, Options? options}) async {
    try {
      return _dio.put(url, data: map, options: options);
    } on DioError catch (e) {
      formatError(e);
    }
    return null;
  }

  Future<Response?> putForm(String url, Map<String, dynamic> map,
      {Options? options}) async {
    try {
      FormData formData = FormData.fromMap(map);
      return await _dio.put(url, data: formData, options: options);
    } on DioError catch (e) {
      formatError(e);
    }
    return null;
  }

  delete(String url, {Map<String, dynamic>? map, Options? options}) async {
    try {
      return await _dio.delete(url, data: map, options: options);
    } on DioError catch (e) {
      formatError(e);
    }
  }

  downLoad(urlPath, savePath) async {
    try {
      Response response = await _dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        debugPrint("$count $total");
      });
      debugPrint("downLoadFile response: $response");
      return response;
    } on DioError catch (e) {
      debugPrint("downLoadFile exception: $e");
      formatError(e);
    }
  }

  void formatError(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      debugPrint("连接超时");
    } else if (e.type == DioErrorType.sendTimeout) {
      debugPrint("请求超时");
    } else if (e.type == DioErrorType.receiveTimeout) {
      debugPrint("响应超时");
    } else if (e.type == DioErrorType.response) {
      debugPrint("出现异常");
    } else if (e.type == DioErrorType.cancel) {
      debugPrint("请求取消");
    } else {
      debugPrint("未知错误");
    }
  }
}
