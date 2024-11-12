import 'dart:async';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {

  DBhelper._();

  static  DBhelper getinstance()=> DBhelper._();

  Database? mdb;
  static final String Table_todo_name="todo";
  static final String Column_todo_id="todoid";
  static final String Column_todo_title="title";
  static final String Column_todo_desc="desc";
  static final String Column_todo_time="time";
  static final String Column_todo_status="status";
  static final String Column_todo_isdone="";



  Future<Database> getDB() async{
    if(mdb!=null){
      return mdb!;
    }else{
      mdb= await opendb();
      return mdb!;
    }
  }
  /* Future<Database> openDB() async{
     var appdir= await getApplicationDocumentsDirectory();
     var dbpath= join(appdir.path, "todo.db");
    return OpenDatabse()
    }
*/
  Future<Database> opendb() async{
    var appdir=  await getApplicationDocumentsDirectory();
    var dbpath= join(appdir.path, "todo.db");
    return openDatabase(dbpath, version: 1, onCreate: (db,version){
      db.execute("create table $Table_todo_name ($Column_todo_id integer primary key autoincrement, $Column_todo_title text, $Column_todo_desc text , $Column_todo_time text, $Column_todo_status text, $Column_todo_isdone integer )" );

    });

  }
  Future<bool> createtodo({required String title, required String desc, required String time , required int status, required int isdone }) async{
    var db= await getDB();
    int rowseffected= await db.insert(Table_todo_name,{
      Column_todo_title:title,
      Column_todo_desc:desc,
      Column_todo_time: time,
      Column_todo_status:status,
      Column_todo_isdone:isdone

    });
    return rowseffected>0;

  }
  Future<List<Map<String, dynamic>>> gettask() async{
    var db= await getDB();
    List<Map<String, dynamic>> mdata= await  db.query(Table_todo_name);


    return mdata;


  }
  Future<bool> deletetask( {required int id}) async {
    var db = await getDB();
    int rowseffected=  await db.delete(Table_todo_name,where:" $Column_todo_id = $id " );
    return rowseffected>0;

  }
  Future <bool> update({required String updatetitle, required String updatedesc, required int id, required int status}) async{
    var db= await getDB();
    int rowseffected= await db.update(Table_todo_name, {
      Column_todo_title:updatetitle,
      Column_todo_desc:updatedesc,
    }, where: " $Column_todo_id = $id ");
    return rowseffected>0;



  }
}