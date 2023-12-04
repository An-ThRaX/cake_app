// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: NinjaCard(),
    ));

class NinjaCard extends StatelessWidget {
  const NinjaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/thumb.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Bla Bla',
              style: TextStyle(
                color: Colors.yellowAccent,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Current ninja Level',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '8',
              style: TextStyle(
                color: Colors.yellowAccent,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'blabla@bla.bla',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
