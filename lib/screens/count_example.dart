import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  // void initState(){
  //   super.initState();
  //   final countProvider = Provider.of<CountProvider>(context, listen: false);
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     countProvider.setCount();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context,value,child){
          print("BUILD only");
          return Text(countProvider.count.toString(), style: TextStyle(fontSize: 50),);
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
