// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o/controller/taskController.dart';
import 'package:o/database/dbHelper.dart';
import 'package:o/model/task.dart';
import 'package:o/view/utils/utils.dart';

//
class setting extends StatelessWidget {
  //===================================
  taskController z = taskController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreyClr,
      appBar: AppBar(
        title: Text("l o g i c",
            style: custumTextStyle(25, bluishClr, FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.offAllNamed(""),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //==================================================== editData
              //===============================================================
              //----------------- selectDate
              TextButton(
                  onPressed: () async {
                    List<Map> response = await DBHelper.query();
                    print(response);
                  },
                  child: Text("readData",
                      style: custumTextStyle(25, bluishClr, FontWeight.bold))),
              //----------------- insertDate
              TextButton(
                  onPressed: () async {
                    int response = await DBHelper.insert(Task(
                      color: 1,
                      title: "xTitle",
                      note: "xNote",
                    ));

                    print(response >= 1
                        ? "--->> insert data success"
                        : "--->> error");
                  },
                  child: Text("insertData",
                      style: custumTextStyle(25, bluishClr, FontWeight.bold))),

              //----------------- deleteAllData
              TextButton(
                  onPressed: () async {
                    int response = await DBHelper.deleteAll();
                    z.getTasks();
                    print(response >= 1 ? "---> delete succes" : "---> error");
                  },
                  child: Text("deleteAllData",
                      style: custumTextStyle(25, bluishClr, FontWeight.bold))),
              //-----------------updateDate
              TextButton(
                  onPressed: () async {
                    int response = await DBHelper.update(1, 8);
                    print(response);
                    print(response >= 1 ? "---> update succes" : "---> error");
                  },
                  child: Text("updateData",
                      style: custumTextStyle(25, bluishClr, FontWeight.bold))),

              //===================================================== editDB
              //================================================================
              //intialDb
              Container(
                height: 2,
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 10),
                color: bluishClr,
              ),
              TextButton(
                  onPressed: () async {
                    await DBHelper.initDb();
                  },
                  child: Text("initi db",
                      style: custumTextStyle(25, pinkClr, FontWeight.bold))),
              //deleteDatabase
              TextButton(
                  onPressed: () async {
                    await DBHelper.mydeleteDatabase();
                    print("---> delete database success");
                  },
                  child: Text("delete db",
                      style: custumTextStyle(25, pinkClr, FontWeight.bold))),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
