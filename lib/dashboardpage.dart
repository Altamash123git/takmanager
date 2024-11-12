import 'package:flutter/material.dart';
import 'package:task_manager/add_task.dart';
import 'package:task_manager/detail_page.dart';
import 'package:task_manager/home_page.dart';
import 'package:task_manager/profile_page.dart';

class Dashboard extends StatefulWidget {

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List pages= [Homepage() ,addtask(),profilePage()];

int selectedPage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (item){
            setState(() {
              selectedPage=item;
            });

          },
          items:const [
            BottomNavigationBarItem(icon:Icon(Icons.home,color: Colors.red,size: 25,),label: "" ),


            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outlined,color: Colors.red,size: 35,),label: ""),
           // BottomNavigationBarItem(icon: Icon(Icons.notifications_active,size: 25,color: Colors.red,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle,color: Colors.red,size: 25,),label: ""),

          ] ),
    );
  }
}
