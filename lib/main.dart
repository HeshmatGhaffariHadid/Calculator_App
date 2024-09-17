import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();
  int? usdAmount;
  int afghani = 70;
  String note = 'Current USD unit value';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Currency calculator App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: myController,
                cursorColor: Colors.grey.shade500,
                enableSuggestions: true,
                autofocus: true,
                decoration: const InputDecoration(
                  focusedBorder:UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.blue,
                  ),
                  ),
                  focusColor: Colors.black26,
                  hintText: 'Enter amount of USD',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black38,
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (input){
                  setState(() {
                    usdAmount = int.tryParse(input);
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    afghani *= usdAmount!;
                    note = 'Result';
                  });
                },
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Calculate ',
                      style: TextStyle(
                        backgroundColor: Colors.blue,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '$note: $afghani afs',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.blue,
                child: TextButton(
                  child: Text('Reset',style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),),
                  onPressed: (){
                    setState(() {
                      afghani = 70;
                      note = 'Current USD unit value';
                    });

                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
