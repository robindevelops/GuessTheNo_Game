// ignore_for_file: camel_case_types, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class textfield extends StatefulWidget {
  TextEditingController controller;
  textfield({super.key, required this.controller});

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Enter Your Number",
          prefixIcon: Icon(Icons.numbers),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
