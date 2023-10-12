import 'package:flutter/material.dart';
import '../../model/task.dart';
import '../utils/utils.dart';

//
class taskCard extends StatelessWidget {
  Task? _dataTask;
  taskCard(this._dataTask);

  //
  getBGClr_(int? color) {
    switch (color) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return orangeClr;
      default:
        return bluishClr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.fromLTRB(10, 0, 5, 10),
      decoration: BoxDecoration(
        color: getBGClr_(_dataTask!.color),
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(color: bluishClr, width: 0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---------------- 1

          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "${_dataTask!.title}",
              style: custumTextStyle(22, darkGreyClr, FontWeight.w600, "f2"),
            ),
          )),
          //---------------- 2
          const Divider(
            color: darkGreyClr,
            endIndent: 50,
            indent: 50,
            thickness: 1,
            height: 20,
          ),

          Text(
            "${_dataTask!.note}",
            style: custumTextStyle(18, g3, FontWeight.w400, "ff"),
          ),
        ],
      ),
    );
  }
}


/* 
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      padding: EdgeInsets.fromLTRB(10, 0, 5, 10),
                      decoration: BoxDecoration(
                        color: w,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //---------------- 1
                          Text("${i}"),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              "${notes[i]["title"]}",
                              style: X(18, b, FontWeight.w600, "f2"),
                            ),
                          )),
                          //---------------- 2
                          const Divider(
                            color: Colors.grey,
                            endIndent: 50,
                            indent: 50,
                            thickness: 0.5,
                            height: 20,
                          ),
                          Text(
                            "${notes[i]["note"]}",
                            style: X(15, b, FontWeight.w500, "f2"),
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ), 
                    
                    
                    */
                  


/*                   Container(
      // height: 50,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: getBGClr_(_dataTask!.color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        children: [
          Text(
            "${_dataTask!.note} ---> ${_dataTask!.title}",
            style: custumTextStyle(20, g3, FontWeight.w500, "ff"),
          ),
        ],
      ),
    ); */