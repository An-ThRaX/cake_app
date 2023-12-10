import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

 Future<List<List<dynamic>>> loadCSV() async {
     final fileCSV = await rootBundle.loadString("assets/book2.csv");
     List<List<dynamic>> listData = 
     const CsvToListConverter().convert(fileCSV);
     return listData;
  }