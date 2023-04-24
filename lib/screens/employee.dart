import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:manager/constants/text_decoration.dart';

class Employee extends StatelessWidget {
  final DocumentSnapshot data;
  const Employee({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(data['image']),
                    radius: 70,
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee Id: ${data['id']}',
                          style: kTextStyle.copyWith(
                              color: Colors.black38,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          'Name: ${data['name']}',
                          style: kTextStyle.copyWith(
                              color: Colors.black38,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          'Position: ${data['position']}',
                          style: kTextStyle.copyWith(
                              color: Colors.black38,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Review:',
                      style: kTextStyle.copyWith(
                          color: Colors.black38,
                          decoration: TextDecoration.none),
                    ),
                    DottedBorder(
                      color: Colors.black38,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          data['review'],
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Performance:',
                style: kTextStyle.copyWith(
                    color: Colors.black38, decoration: TextDecoration.none),
              ),
            ],
          )),
    );
  }
}
