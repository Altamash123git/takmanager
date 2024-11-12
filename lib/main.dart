import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/dashboardpage.dart';
import 'package:task_manager/provider.dart';
import 'package:task_manager/splashPage.dart';
//import 'package:todo/provider.dart';

import 'db_helper.dart';
import 'firebase_options.dart';
import 'loginpage.dart';
import 'signin.dart';
import 'notifications.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await NotificationServices.initialize();
  runApp(ChangeNotifierProvider(
      child:  MyApp(),
      create: (context)=>taskprovider(dBhelper: DBhelper.getinstance())),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Splashpage(),
    );

  }
}
