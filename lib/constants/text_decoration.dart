import 'package:flutter/material.dart';

const kTextStyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400);
const kLoginTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
const kLoginInputDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kEmployeeInput = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
      borderSide: BorderSide(
    color: Colors.black12,
    width: 1,
  )),
);
