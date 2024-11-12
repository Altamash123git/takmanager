import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/provider.dart';

///import 'package:todo/provider.dart';

import 'db_helper.dart';

class detail_page extends StatefulWidget {
  String? id;
  String title;
  String desc;
  detail_page({this.id, required this.title, required this.desc});

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  int? ongoingcount;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DBhelper dbhelper = DBhelper.getinstance();
  String uid = "";
  TextEditingController updatetitlecontroller = TextEditingController();
  TextEditingController updatedesccontroller = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    getUid();
    setState(() {});
  }

  void getUid() async {
    var prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uid") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //ongoingcount=  context.watch<taskprovider>().getalltask().length;
    return Scaffold(
        backgroundColor: Color(0xff282828),
        appBar: AppBar(
          backgroundColor: Color(0xff282828),
          title: Text(
            "DETAIL",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: IconButton(
                onPressed: () async {
                  showModalBottomSheet(
                      isDismissible: false,
                      enableDrag: false,
                      context: context,
                      builder: (_) {
                        return showmodal();
                      });
                  updatetitlecontroller.text = widget.title;
                  updatedesccontroller.text = widget.desc;
                  setState(() {});
                },
                icon: Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(onPressed: ()async{
              firestore
                  .collection("users")
                  .doc(uid)
                  .collection("tasks")
                  .doc(widget.id).delete();
              Navigator.pop(context);

            }, icon: Icon(Icons.delete,color: Colors.red,)),
            ElevatedButton(
                onPressed: () async {
                  firestore.collection("tasks").doc(widget.id).update({
                    "isCompleted": true,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    "task completed",
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.center,
                  )));
                },
                child: Text("Mark as Complete")),

          ],
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Flexible(
                child: Container(
              child: Text(
                widget.desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ))
          ],
        ));
  }

  Widget showmodal() {
    return Container(
      //alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: updatetitlecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              //hintText: "update title "
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: updatedesccontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              //hintText: "upadate desc"
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: () async {
                  firestore
                      .collection("users")
                      .doc(uid)
                      .collection("tasks")
                      .doc(widget.id)
                      .update({
                    "title": updatetitlecontroller.text,
                    "desc": updatedesccontroller.text
                  });
                  Navigator.pop(context);

                },
                child: Text("update"),
              )),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: TextButton(
                child: Text("Cancel"),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ))
            ],
          ),


        ],
      ),
    );
  }
}
