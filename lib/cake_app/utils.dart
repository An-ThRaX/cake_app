import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<List<dynamic>>> loadCSV() async {
  final fileCSV = await rootBundle.loadString("assets/book2.csv");
  List<List<dynamic>> listData = const CsvToListConverter().convert(fileCSV);
  return listData;
}

Text textStyling(String text,
    {FontWeight fontWeight = FontWeight.normal, double customSize = 10.0}) {
  return Text(text,
      style: TextStyle(
          fontFamily: 'Caveat',
          color: Colors.blueGrey,
          fontSize: customSize,
          fontWeight: fontWeight));
}

double calculateAppBarHeight(BuildContext context) {
  // Customize this function based on your text styling
  double textHeight = DefaultTextStyle.of(context).style.fontSize ?? 18.0;
  double appBarHeight = kToolbarHeight +
      textHeight; // kToolbarHeight is the default AppBar height
  return appBarHeight;
}
