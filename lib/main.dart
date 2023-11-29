import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prajituri si nu numai'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 102),
        child: Text('asd ad ad '),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple[300],
        child: const Text('Add 1'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
