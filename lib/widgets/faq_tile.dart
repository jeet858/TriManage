import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager/constants/text_decoration.dart';

class FAQTile extends StatelessWidget {
  final DocumentSnapshot document;

  const FAQTile({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color.fromRGBO(248, 156, 46, 1), width: 2),
          bottom: BorderSide(color: Color.fromRGBO(248, 156, 46, 1), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Color.fromRGBO(194, 194, 194, 100),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          document['question'],
          style: kTextStyle.copyWith(color: Colors.black),
          overflow: TextOverflow.fade,
          maxLines: 5,
        ),
        children: [
          Container(
            child: Text(
              document['answer'],
              style: kTextStyle.copyWith(
                  color: const Color.fromRGBO(58, 18, 45, 1)),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}

// freestar Lorem ipsum dolor sit amet
// consectetur adipiscing elit.
// Integer lacinia augue at nibh luctus pulvinar ut in nunc.
// Curabitur facilisis pulvinar odio, ut vestibulum massa volutpat id.
// Quisque libero turpis, volutpat sed imperdiet eget, ornare at nisl.
// Pellentesque at fringilla turpis. Duis dignissim lacinia mi id congue
//
// freestar Lorem ipsum dolor sit amet,
// freestar Lorem ipsum dolor sit amet,
// freestar Lorem ipsum dolor sit amet
