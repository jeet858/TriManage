import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddFAQ extends StatelessWidget {
  AddFAQ({Key? key}) : super(key: key);

  final questionController = TextEditingController();

  final answerController = TextEditingController();

  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            const Text('Add FAQ'),
            const SizedBox(height: 15),
            TextField(
              controller: questionController,
              decoration: const InputDecoration(hintText: 'Question'),
            ),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(hintText: 'Answer'),
            ),
            ElevatedButton(
              onPressed: () {
                _fireStore.collection('faqs').add({
                  'question': questionController.text,
                  'answer': answerController.text,
                });
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
