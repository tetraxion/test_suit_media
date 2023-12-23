// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test_suitmedia/model/userModel.dart';

class PalindromeController {
  final PalindromeModel model;

  PalindromeController(this.model);

  AlertDialog createAlertDialog(String msg) {
    return AlertDialog(
      title: const Text("Checker"),
      content: Text(msg),
    );
  }
}
