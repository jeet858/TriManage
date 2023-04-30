import 'package:cloud_firestore/cloud_firestore.dart';
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
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data['image']),
                      radius: 100,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    height: 100,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee Id: ${data['id']}',
                          style: kTextStyle.copyWith(
                              color: Colors.black38,
                              decoration: TextDecoration.none,
                              fontSize: 15),
                          maxLines: 3,
                        ),
                        Text(
                          'Name: ${data['name']}',
                          style: kTextStyle.copyWith(
                              color: Colors.black38,
                              decoration: TextDecoration.none,
                              fontSize: 15),
                          maxLines: 3,
                        ),
                        Text(
                          'Position: ${data['position']}',
                          style: kTextStyle.copyWith(
                              color: Colors.black38,
                              decoration: TextDecoration.none,
                              fontSize: 15),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    top: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
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
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        data['review'],
                        style: kTextStyle.copyWith(
                            color: Colors.black,
                            decoration: TextDecoration.none),
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
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Image.asset(
                  'assets/images/pie chart.jpg',
                ),
              ),
              Text(
                'Shifts:',
                style: kTextStyle.copyWith(
                    color: Colors.black38, decoration: TextDecoration.none),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Text(
                          'Monday',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          '9.00AM - 5.00PM',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Tuesday',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          '9.00AM - 5.00PM',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Wednesday',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          '9.00AM - 5.00PM',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Thursday',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          '9.00AM - 5.00PM',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Friday',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          '9.00AM - 5.00PM',
                          style: kTextStyle.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Note:',
                style: kTextStyle.copyWith(
                    color: Colors.black38, decoration: TextDecoration.none),
              ),
              const SizedBox(
                height: 200,
              )
            ],
          )),
    );
  }
}
