import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SaveButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final double fontSize;


  SaveButtonWidget(
      {super.key, required this.buttonText, this.buttonColor, this.onPressed, required this.fontSize, });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var devWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        height: 50,
        minWidth: 200,
        color:  ColorTheme.lightBlue,
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      ),
    );
  }
}

