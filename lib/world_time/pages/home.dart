import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea moves the widget to avoid the OS interfaces
      body: SafeArea(
        child: Column(
          children: [
            const Text('Home page'),
            TextButton.icon(
              onPressed: (){
                // this will load on the current screen the desired page; in this case, location route
                Navigator.pushNamed(context, '/location');
              }, 
              icon: const Icon(Icons.edit_location), 
              label: const Text('Edit Location')),
          ],
        )
      ),
    );
  }
}