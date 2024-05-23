import 'package:flutter/material.dart';

class MainFrameButton extends StatelessWidget {
  final Color color;
  final String butttonName;
  final VoidCallback? onpressed;

  const MainFrameButton(
      {super.key,
      required this.color,
      required this.butttonName,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color,
      height: 50,
      minWidth: 150,
      child: Text(
        butttonName,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
      ),
    );
  }
}
