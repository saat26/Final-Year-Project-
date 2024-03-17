import 'package:flutter/material.dart';

const kPrimaryColor = Colors.deepOrange;
final kPrimaryLightColor = Colors.grey[50];

const double defaultPadding = 16.0;

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return "validEmail";
  } else {
    return null;
  }
}

String? validateEmptyField(String? text) =>
    text == null || text.isEmpty ? 'This field can\'t be empty.' : null;
