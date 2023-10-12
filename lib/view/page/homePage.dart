import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o/controller/taskController.dart';
import '../../database/dbHelper.dart';
import '../../model/task.dart';
import '../utils/sizeConfig.dart';
import '../utils/utils.dart';
import '../widgets/floatingActionButton.dart';
import '../widgets/taskCard.dart';

//
class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final dateTime_ = DateFormat('MMMM-d-yyyy').format(DateTime.now()).toString();

  //
  final taskController z = Get.put(taskController());

  //
  @override
  void initState() {
    super.initState();

    z.getTasks();
    print("-----------> getTasks() succes");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: darkGreyClr,
      appBar: AppBar(
        title: Text(
          "$dateTime_",
          style: custumTextStyle(20, g3, FontWeight.w500, "ff"),
        ),
        leading: IconButton(
          icon: Icon(Icons.tune, color: bluishClr),
          onPressed: () => Get.toNamed("s2"),
        ),
      ),
      floatingActionButton: floatingButton(
        icon: const Icon(Icons.add),
        fun: () {
          Get.toNamed("s1");
        },
      ),
      //
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child:  _showTasks(),
      ),
    );
  }

  _showTasks() {
    return Obx(
      () {
        print("--->> Obx rebuilder");
        //if
        if (z.taskList_.isEmpty) {
          return _noTaskMsg();
        }
        //else
        else {
          return ListView.builder(
            // scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            itemCount: z.taskList_.length,
            itemBuilder: (context, index) {
              var _dataTask = z.taskList_[index];
              return GestureDetector(
                // onLongPress: () => print(_dataTask.id),
                onTap: () => showBottomSheet(context, _dataTask),
                child: taskCard(_dataTask),
              );
            },
          );
        }
      },
    );
  }

  _noTaskMsg() {
    return SingleChildScrollView(
      child: Container(
        height: SizeConfig.screenHeight! * 0.9,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "not found any \n tasks !",
                style: custumTextStyle(20, g3, FontWeight.w500, "ff"),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //=================================================== methods
  showBottomSheet(BuildContext context, Task _data) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          width: SizeConfig.screenWidth,
          color: darkGreyClr,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  height: 6,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBottomSheet(
                    label: 'Cancel',
                    onTap: () => Get.back(),
                    clr: primaryClr,
                  ),
                  const SizedBox(width: 10),
                  _buildBottomSheet(
                    label: 'delete Task',
                    onTap: () {
                      z.deleteTasks(_data);
                      Get.back();
                    },
                    clr: Colors.red[400]!,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // 2
  _buildBottomSheet(
      {required String label,
      required Function() onTap,
      required Color clr,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        height: 65,
        width: SizeConfig.screenWidth! * 0.4,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(10),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(label,
              style: custumTextStyle(20, darkGreyClr, FontWeight.w700)),
        ),
      ),
    );
  }
}
