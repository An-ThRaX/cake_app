import 'package:cake_app/quotes.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  const QuoteCard({super.key, required this.quote});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                quote.text,
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Center(
              child: Text(
                quote.author,
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Delete quote'),
              icon: const Icon(Icons.delete),
              
            )
          ],
        ),
      ),
    );
  }
}
