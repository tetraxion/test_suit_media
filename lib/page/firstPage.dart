// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test_suitmedia/color/colors.dart';
import 'package:test_suitmedia/controller/firstPage_controller.dart';
import 'package:test_suitmedia/model/userModel.dart';
import 'secondPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late PalindromeModel model;
  late PalindromeController controller;

  @override
  void initState() {
    model = PalindromeModel();
    controller = PalindromeController(model);
    super.initState();
  }

  @override
  void dispose() {
    model.name.dispose();
    model.palindrome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_1.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(96, 255, 255, 255),
                    child: Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: model.name,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: model.palindrome,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Palindrome",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.model.checkPalindrome(model.name.text)) {
                        showDialog(
                          context: context,
                          builder: (_) =>
                              controller.createAlertDialog("isPalindrome"),
                        );
                        return;
                      }
                      showDialog(
                        context: context,
                        builder: (_) =>
                            controller.createAlertDialog("not palindrome"),
                      );
                    },
                    style: MyColor.buttonStyle(size),
                    child: const Text(
                      "CHECK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SecondPage(name: model.name.text),
                      ),
                    ),
                    style: MyColor.buttonStyle(size),
                    child: const Text("NEXT",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
