// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotifyUtil {
//   final FlutterLocalNotificationsPlugin np = FlutterLocalNotificationsPlugin();
//
//   // NotifyUtil() {
//   //   init();
//   // }
//
//   init() async {
//     var android = const AndroidInitializationSettings("@mipmap/ic_launcher");
//     var ios = const IOSInitializationSettings();
//
//     await np.initialize(InitializationSettings(android: android, iOS: ios),
//         onSelectNotification: selectNotification);
//   }
//
//   void selectNotification(String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//
//       // todo 这里根据自己的业务处理
//
//     }
//   }
//
//   void show(String title, String body, {int? id}) {
//     var android = const AndroidNotificationDetails(
//       //区分不同渠道的标识
//       'channelId',
//       //channelName渠道描述不要随意填写，会显示在手机设置，本app 、通知列表中，
//       //规范写法根据业务：比如： 重要通知，一般通知、或者，交易通知、消息通知、等
//       'channelName',
//       //通知的级别
//       importance: Importance.max,
//       priority: Priority.high,
//       //可以单独设置每次发送通知的图标
//       // icon: ''
//       //显示进度条 3个参数必须同时设置
//       // progress: 19,
//       // maxProgress: 100,
//       // showProgress: true
//
//     );
//     //ios配置选项相对较少
//     var ios = const IOSNotificationDetails();
//
//     np.show(id ?? DateTime.now().millisecondsSinceEpoch >> 10, title, body,
//         NotificationDetails(android: android, iOS: ios));
//   }
//
//   void cancelAll() {
//     np.cancelAll();
//   }
//
//   void cancel(int id) {
//     np.cancel(id);
//   }
// }
