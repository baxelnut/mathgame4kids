import 'package:flutter/material.dart';
import '../const.dart';

class MyButton extends StatefulWidget {
  final String child;
  final VoidCallback onTap;

  const MyButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  var buttonColor = Colors.pinkAccent[400];

  @override
  Widget build(BuildContext context) {
    if (widget.child == 'C') {
      buttonColor = Colors.blueAccent;
    } else if (widget.child == 'DEL') {
      buttonColor = Colors.red;
    } else if (widget.child == '=') {
      buttonColor = Colors.green;
    } else if (widget.child == '') {
      buttonColor = Colors.transparent;
    }

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              widget.child,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
