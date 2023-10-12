import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o/database/dbHelper.dart';
import 'package:o/view/page/homePage.dart';
import 'package:o/view/page/setting.dart';
import 'view/page/addTaskPage.dart';
import 'view/utils/utils.dart';

// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//
void main() async {
  //1
  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
  //2
  await DBHelper.initDb();
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // taskController z = Get.put(taskController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.themeApp,
      // home: name(),
      //
      getPages: [
        GetPage(name: "/", page: () => homePage()),
        GetPage(name: "/s1", page: () => addTaskPage()),
        GetPage(name: "/s2", page: () => setting()),
      ],
    );
  }
}

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("ooo")),
    );
  }
}
