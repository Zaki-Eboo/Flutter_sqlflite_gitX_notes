// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

//============================================
class floatingButton extends StatelessWidget {
  //
  Function() fun;
  Icon icon;

  //
  floatingButton({
    required this.icon,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: fun,
      child: icon,
    );
  }
}
