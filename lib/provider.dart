
import 'package:flutter/foundation.dart';

import 'db_helper.dart';
//import 'package:todo/db_helper.dart';

class taskprovider extends ChangeNotifier{
  DBhelper dBhelper;
  taskprovider({required this.dBhelper});
  List<Map<String, dynamic>> _mdata=[];
  List<Map<String, dynamic>> getalltask()=>_mdata;

  void addtask({required String title, required String desc, required String time, required int status}) async{
    bool check= await dBhelper.createtodo(title: title, desc: desc, time: time, status: status,isdone: 0);
    if (check ){
      _mdata= await dBhelper.gettask();
      notifyListeners();
    }
  }
  void gettask() async{
    _mdata= await dBhelper.gettask();
    notifyListeners();
  }



  void updatetask({required String updatetitle, required String updatedesc, required int id,required int status})async {
    bool check = await dBhelper.update(updatetitle: updatetitle, updatedesc: updatedesc, id: id, status:status );
    if(check){
      _mdata= await dBhelper.gettask();
      notifyListeners();
    }
  }
  void deletetask({required int id}) async {
    bool check =await dBhelper.deletetask(id: id);
    if (check){
      _mdata= await dBhelper.gettask();
      notifyListeners();
    }
  }
}