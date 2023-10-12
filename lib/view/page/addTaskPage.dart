import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:o/model/task.dart';
import 'package:o/view/widgets/floatingActionButton.dart';
import '../../controller/taskController.dart';
import '../utils/utils.dart';
import '../widgets/inputFeild.dart';

//========================================
class addTaskPage extends StatefulWidget {
  @override
  State<addTaskPage> createState() => _addTaskPageState();
}

class _addTaskPageState extends State<addTaskPage> {
  //--------------
  final taskController z = Get.put(taskController());
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("addTask"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: darkGreyClr,
      floatingActionButton: floatingButton(
          icon: const Icon(Icons.save),
          fun: () {
            _addTasksToDb();
            z.getTasks();
            Get.back();
          }),

      //
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //----------------------- InputField
              SizedBox(height: 50),
              InputField(
                heightTextField: 50,
                title: "Title",
                hint: "enter title",
                controller_: _titleController,
              ),
              InputField(
                heightTextField: 150,
                title: "Note",
                hint: "enter note",
                controller_: _noteController,
              ),
      
              //----------------------- colorRow
              SizedBox(height: 20),
              _colorPalette(),
            ],
          ),
        ),
      ),
    );
  }

  //=================================================== methods
  //============================================================
  //addTasksToDb
  _addTasksToDb() async {
    int value = await z.addTask(
      Task(
        title: _titleController.text,
        note: _noteController.text,
        color: _selectedColor,
      ),
    );

    //
    print('---> id value = $value');
  }

  // colorPalette
  Column _colorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-------------- Text
        Text("Color", style: custumTextStyle(25, g3, FontWeight.w800)),
        const SizedBox(height: 6),
        //-------------- Row

        Container(
          padding: EdgeInsets.only(left: 2),
          child: Row(
            children: List.generate(
              3,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    child: _selectedColor == index
                        ? Icon(
                            Icons.done,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                    //---------
                    radius: 15,
                    backgroundColor: (index == 0)
                        ? primaryClr
                        : (index == 1)
                            ? pinkClr
                            : orangeClr,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
