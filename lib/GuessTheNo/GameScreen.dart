// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/GuessTheNo/Widgets/Button.dart';
import 'package:flutter_application_1/GuessTheNo/Widgets/Textfield.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int you = 0;
  int computer = 0;
  int? computerNo;
  int? PlayerNo;

  TextEditingController input = TextEditingController();

  @override
  void initState() {
    super.initState();

    GenerateRandomNumber();
  }

  // -------- Generate Random Number Funcation ----------

  void GenerateRandomNumber() {
    Random random = Random();

    int randomNo = random.nextInt(10) + 1;

    setState(
      () {
        computerNo = randomNo;
      },
    );

    // print(computerNo);  <--- Comment out this if you want to debug
  }

// -------- Logic Checker Funcation -------

  void CheckNo(String no) {
    PlayerNo = int.tryParse(no);

    if (PlayerNo == computerNo) {
      setState(() {
        you++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("You Win"),
        ),
      );

      showDilog(context, "You Won", Icon(Icons.person));
    } else if (no.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.yellow,
          content: Text(
            "⚠ Enter The No First",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      setState(
        () {
          computer++;
        },
      );

      showDilog(context, "Computer Win ", Icon(Icons.laptop));
    }
    GenerateRandomNumber(); //Genrate New No After Each attemp
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "GUESS THE NUMBER",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Computer"),
                      Icon(Icons.laptop, size: 70),
                      Text(computer.toString())
                    ],
                  ),
                  Column(
                    children: [
                      Text("You"),
                      Icon(Icons.person, size: 70),
                      Text(you.toString())
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              textfield(controller: input),
              SizedBox(height: 30),
              MyButton(
                onPressed: () {
                  CheckNo(input.text);
                  input.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dilog Box

void showDilog(BuildContext context, String messsage, Icon icon) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.grey[200],
        icon: icon,
        title: Text(messsage),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Try Again"),
            ),
          ),
        ],
      );
    },
  );
}
