import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/dashboardpage.dart';
import 'package:task_manager/home_page.dart';
import 'package:task_manager/loginpage.dart';

class Splashpage extends StatefulWidget {


  @override
  State<Splashpage> createState() => _SplashpageState();


}

class _SplashpageState extends State<Splashpage> {

  void initState(){
    super.initState();
Timer(Duration(seconds: 1),()async{
  SharedPreferences mpref= await SharedPreferences.getInstance();
  //var value =  mpref.getBool('isLoggedIn')!;
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = mpref.getBool('isLoggedIn') ?? false;

  print("this is $isLoggedIn");

    isLoggedIn ? Navigator.push(context, MaterialPageRoute(builder: (c)=>Dashboard() )): Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginPage() ));
   /*if(value==true){
     Navigator.push(context, MaterialPageRoute(builder: (c)=>Homepage() ));

   }else{
     Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginPage() ));

   }*/

});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
