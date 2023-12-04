// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'quote_card.dart';
import 'quotes.dart';

void main() => runApp(MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  // create a list with objects of the Quote class which contains author and text
  List<Quote> quoteList = [
    Quote(author: 'marcel', text: 'asd ads asd asd'),
    Quote(author: 'ariel', text: 'asda sa ftgse  sdf '),
    Quote(author: 'valorant', text: 'qwe ts d hfutsad sad asd as '),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: Text(
          'Awesome Quotes',
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        // children expects a list as argument
        // .map will take each item from the given list 'quoteList' and
        // returns the quote inside a Widget named QuoteCard which is a template of  the displayed card
        // using .toList() will return the entire thing as list to make "children" happy
        children: quoteList.map((quote) => QuoteCard(
          quote: quote,
          // here we define what delete does because it's the only place where it can do it
          // since it is a statefull widget
          delete: (){
            setState(() {
              quoteList.remove(quote);
            });
          }
        )).toList(),
      ),
    );
  }
}
