// ignore_for_file: file_names
import 'package:flutter/material.dart';

class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
    );
  }
}

class PalindromeModel {
  late TextEditingController name;
  late TextEditingController palindrome;

  PalindromeModel() {
    name = TextEditingController();
    palindrome = TextEditingController();
  }

  bool checkPalindrome(String text) {
    text = text.replaceAll(" ", "");
    String temp = "";
    for (int i = text.length; i > 0; i--) {
      temp += text[i - 1];
    }

    palindrome.text = temp;
    return text == temp;
  }
}



