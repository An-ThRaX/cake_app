import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
//   void getData() async {
  // in a Response type variable store the response given by the API
//     Response response =
  // sintax to parse a string to an Uri so that we get the response
//         await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  // save in a Map type variable the decoded response
  // the response comes in a String format - it has to be converted to be usable
//     Map data = jsonDecode(response.body);
//     print(data);
//     print(data['title']);
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('loading'),
    );
  }
}
