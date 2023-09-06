import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences? _sp;

  static Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static Future<bool>? put<T>(String key, T value) {
    if (value is String) {
      return _sp?.setString(key, value);
    } else if (value is double) {
      return _sp?.setDouble(key, value);
    } else if (value is int) {
      return _sp?.setInt(key, value);
    } else if (value is bool) {
      return _sp?.setBool(key, value);
    } else if (value is List<String>) {
      return _sp?.setStringList(key, value);
    }
    return Future(() => false);
  }

  static Future<bool>? putObject(String key, Object value) {
    return _sp?.setString(key, json.encode(value));
  }

  static Future<bool>? putObjectList(String key, List<Object> list) {
    List<String>? _dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return _sp?.setStringList(key, _dataList);
  }

  static T? getObj<T>(String key, T Function(Map v) f, {T? defValue}) {
    Map? map = getObject(key);
    return map == null ? defValue : f(map);
  }

  static Map? getObject(String key) {
    String? _data = _sp?.getString(key);
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  static List<T>? getObjList<T>(String key, T Function(Map v) f,
      {List<T>? defValue = const []}) {
    List<Map>? dataList = getObjectList(key);
    List<T>? list = dataList?.map((value) {
      return f(value);
    }).toList();
    return list ?? defValue;
  }

  static List<Map>? getObjectList(String key) {
    List<String>? dataLis = _sp?.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    }).toList();
  }

  static String getString(String key, {String defValue = ''}) {
    return _sp?.getString(key) ?? defValue;
  }

  static bool getBool(String key, {bool defValue = false}) {
    return _sp?.getBool(key) ?? defValue;
  }

  static int getInt(String key, {int defValue = 0}) {
    return _sp?.getInt(key) ?? defValue;
  }

  static double getDouble(String key, {double defValue = 0.0}) {
    return _sp?.getDouble(key) ?? defValue;
  }

  static List<String> getStringList(String key,
      {List<String> defValue = const []}) {
    return _sp?.getStringList(key) ?? defValue;
  }

  static dynamic getDynamic(String key, {Object? defValue}) {
    return _sp?.get(key) ?? defValue;
  }

  static bool containsKey(String key) {
    return _sp?.containsKey(key) ?? false;
  }

  static Set<String>? getKeys() {
    return _sp?.getKeys();
  }

  static Future<bool>? remove(String key) {
    return _sp?.remove(key);
  }

  static Future<bool>? clear() {
    return _sp?.clear();
  }

  static Future<void>? reload() {
    return _sp?.reload();
  }
}
