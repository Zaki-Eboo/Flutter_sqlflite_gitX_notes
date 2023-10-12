import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o/view/utils/utils.dart';

class InputField extends StatelessWidget {
  //-------------------
  final String title;
  final String hint;
  final double heightTextField;
  final TextEditingController controller_;
  final Widget? widget_;

  //-------------------
  const InputField({
    required this.title,
    required this.hint,
    required this.controller_,
    required this.heightTextField,
    this.widget_,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-------------------------------------------------------------- text
          //--------------------------------------------------------------------
          Text(title, style: custumTextStyle(25, g3, FontWeight.w800)),
          Container(
            padding: EdgeInsets.only(top: 0, left: 14),
            margin: EdgeInsets.only(left: 0, top: 2),
            width: size.width,
            height: heightTextField,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: g5, width: 2),
              // color: g6,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    maxLines: 10,
                    controller: controller_,
                    autofocus: false,
                    readOnly: widget_ != null ? true : false,
                    style: custumTextStyle(20, g3, FontWeight.w600),
                    cursorColor:
                        Get.isDarkMode ? Colors.grey[700] : Colors.grey[100],
                    //----------------------------------------------------------
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: custumTextStyle(15, g5, FontWeight.w500),
                      //----------------------
                      border: InputBorder.none,
                    ),
                  ),
                ),
                widget_ ?? Text(""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
