
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:todo/db_helper.dart';

import 'db_helper.dart';
class profilePage extends StatefulWidget {

  var  username;
  profilePage({ this.username});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  DBhelper dBhelper =DBhelper.getinstance();
  double slidervalue=10.0;
  List<Map<String, dynamic>> allnotes=[];
  List<Map<String, dynamic>> profileitems=[
    {
      "name":"Notification",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(Icons.notifications)
    },
    {
      "name":"Security",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(Icons.security),
    },
    {
      "name":"Language & Region",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(CupertinoIcons.globe),
    },
    {
      "name":"Go Premium",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(Icons.check_circle_rounded)
    },
    {
      "name":"Help Center",
      "suffix_icon":Icon(Icons.arrow_forward_ios_outlined),
      "prefix_icon":Icon(Icons.question_mark_rounded),
    },

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan( text: "12\n",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),
                            children: [
                              TextSpan(
                                  text: "In Process tasks",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal)
                              )
                            ]
                        ),

                      ),
                      SizedBox(width: 15,),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/img/IMG_20240316_203634_698.jpg"),

                      ),
                      SizedBox(width: 15,),
                      Text.rich(
                        textAlign: TextAlign.center,

                        TextSpan( text: "42\n",

                            style: TextStyle(

                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),
                            children: [
                              TextSpan(
                                  text: "Completed tasks",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal)
                              )
                            ]
                        ),

                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      widget.username !=null?   Text(" ${widget.username}") :Text("user", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22 ),),
                      SizedBox(height: 13,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              maximumSize: Size(200, 50),
                              minimumSize: Size(150, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),

                              )
                          ),
                          onPressed: (){}, child: Text("product manager",style: TextStyle(color: Colors.white),)),
                      SizedBox(height: 13,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              maximumSize: Size(150, 50),
                              minimumSize: Size(150, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),

                              )
                          ),
                          onPressed: (){}, child: Text("Edit Profile",style: TextStyle(color: Colors.white),))
                    ],
                  )
                ],

              )),
          Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(

                    itemCount: profileitems.length,
                    itemBuilder: (c,i){
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                width: 2,
                                color: Colors.grey

                            )
                        ),
                        child: ListTile(

                          shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(15,)
                          ),
                          leading  : (profileitems[i]["prefix_icon"]),

                          trailing:
                          (profileitems[i]["suffix_icon"]),
                          title: Text((profileitems[i]["name"])),
                        ),
                      );
                    }),
              )
          )
        ],
      ),

    );

  }

}


