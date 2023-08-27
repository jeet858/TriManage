import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FaqDetail extends StatelessWidget {
  final DocumentSnapshot document;

  const FaqDetail({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(248, 156, 46, 1),
      ),
      body: Column(
        children: [
          Text(document['question']),
        ],
      ),
    );
  }
}
