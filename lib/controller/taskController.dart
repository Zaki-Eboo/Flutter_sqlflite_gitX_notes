import 'package:get/get.dart';
import 'package:o/database/dbHelper.dart';
import '../model/task.dart';

//===========================================
class taskController extends GetxController {
  final RxList<Task> taskList_ = <Task>[].obs;

  // add data to table
  addTask(Task? task) {
    return DBHelper.insert(task!);
  }

  // get data from table
  getTasks() async {
    final tasks = await DBHelper.query();
    taskList_.assignAll(tasks.map((e) => Task.fromJson_(e)));
  
  }

  // delete data from table
  void deleteTasks(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  void deleteAllTasks() async {
    await DBHelper.deleteAll();
    getTasks();
  }

  void deleteDB() async {
    await DBHelper.mydeleteDatabase();
  }
}
