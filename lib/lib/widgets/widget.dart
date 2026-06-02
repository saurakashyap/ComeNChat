import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Text(
      'ComeNChat',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.black45,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.teal, width: 2),
    ),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 16,
  );
}

TextStyle mediumTextStyle() {
  return TextStyle(
    fontSize: 16,
  );
}
