/*
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
Future<void> BackgroundHandler(RemoteMessage remotemessage)async{
  log(remotemessage.notification!.title.toString());
}

class NotificationServices{
  static Future<void> initialize() async {
    NotificationSettings notificationSettings= await FirebaseMessaging.instance.requestPermission();
    if(notificationSettings.authorizationStatus==AuthorizationStatus.authorized){
      FirebaseMessaging.onBackgroundMessage(BackgroundHandler);
      FirebaseMessaging.onMessage.listen((message){
        log("message recieved ${message.notification!.title}");
      });
    }
  }
}*/
