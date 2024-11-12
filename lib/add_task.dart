
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/add_task.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//import 'package:todo_application/db_helper2.dart';
//import 'package:todo_application/homePage.dart';*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:todo/provider.dart';


//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/home_page.dart';
import 'package:task_manager/provider.dart';

import 'db_helper.dart';
import 'provider.dart';

class addtask extends StatefulWidget {
  const addtask({super.key});

  @override
  State<addtask> createState() => _addtaskState();
}

class _addtaskState extends State<addtask> {
///String uid="";
  @override



  //DBhelper dbhelper= DBhelper.getinstance();
  //DBhelper dbhelper =DBhelper.getinstance();
  DateTime? selectedDate;
  bool isSwitched= false;
  String uid="";
  var  datetime = DateTime.now().millisecondsSinceEpoch;
  TextEditingController titlecontroller= TextEditingController();
  TextEditingController descontroller= TextEditingController();
  TextEditingController assigneecotroller= TextEditingController();
  TextEditingController datecontroller= TextEditingController();
  DateFormat dtFormat= DateFormat.yMMMd();
  DateTime? selecteDate;
  FirebaseFirestore firestore= FirebaseFirestore.instance;


/*Future < List<Map<String,dynamic>>> didChangeDependencies() async{
    var  inherit=  await Provider.of<state_managmnent>(context,listen: false).getmytask();
    getmynotes();

    return inherit;
  }*/

  void initState() {
    // TODO: implement initState
    super.initState();
    getUid();
    setState(() {

    });
  }
  void getUid()async{
    var prefs= await  SharedPreferences.getInstance();
    uid= prefs.getString("uid") ?? "";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor:  Color(0xfff6f6f6),
        title: Text("Add task", style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),),
                    hintText: "enter title",


                  ),


                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1,
                        color: Theme.of(context).brightness ==
                            Brightness.light
                            ? Colors.black // Dark border color in light mode
                            : Color(0xFFF6F6F6),
                      ),
                      minimumSize: Size(double.infinity, 52),
                      maximumSize: Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      )),
                  onPressed: () async {
                    selectedDate = await showDatePicker(
                        context: context,
                        firstDate:
                       DateTime(2000),
                        lastDate: DateTime(2045));

                    setState(() {});
                  },
                  child: Text(
                    dtFormat.format((selectedDate ?? DateTime.now())),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: assigneecotroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    hintText: "assignee",


                  ),

                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(


                  minLines: 4,
                  maxLines: 50,
                  controller: descontroller,
                  decoration: InputDecoration(
                    //counterText: "",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(13),),
                    hintText: "enter desc",


                  ),

                ),
              ),
              SizedBox(
                height: 1,
              ),


              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.topLeft,
                  child: Text("Category", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(10),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(onPressed: (){}, child: Text("Design ")),
                          ElevatedButton(onPressed: (){}, child: Text("Deevelopment")),
                          ElevatedButton(onPressed: (){}, child: Text("Coding ")),


                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(onPressed: (){}, child: Text("Meeting ")),
                          ElevatedButton(onPressed: (){}, child: Text("Office time ")),
                          ElevatedButton(onPressed: (){}, child: Text("Meeting "))
                        ],
                      )
                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Get update for this task"),
                    Switch(
                      //inactiveTrackColor: Colors.grey,
                      //activeTrackColor: Colors.blue,
                        inactiveThumbColor: Colors.greenAccent,
                        activeColor: Colors.red,

                        value: isSwitched, onChanged: (value){
                      //value=isSwitched;
                      setState(() {
                        isSwitched=value;
                      });
                    })

                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () async{
                          if(titlecontroller.text.isNotEmpty && descontroller.text.isNotEmpty){


                           await firestore.collection("users").doc(uid).collection("tasks").doc(DateTime.now().toString() ).set({
                              "title" : titlecontroller.text,
                              "desc": descontroller.text,
                              "assignee": assigneecotroller.text,
                              "date":dtFormat.format((selectedDate ?? DateTime.now())),
                             "isCompleted":false,


                            });
                          }
                          //addnotes();
                          Navigator.pop(context, MaterialPageRoute(builder: (c)=>Homepage(username: "" ,)));
                        }, child: Text("add",style: TextStyle(color: Colors.white,fontSize: 20),)),
                  )),
                  SizedBox(width: 6,),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: (){

                        //showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2024));
                        Navigator.pop(context, MaterialPageRoute(builder: (c)=>Homepage(username: "",)));

                      }, child: Text("cancel",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),),
                  )),

                ],
              ),




            ],
          ),
        ),
      ),

    );
  }

}

