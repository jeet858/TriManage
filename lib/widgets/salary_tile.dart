import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager/widgets/edit_salary.dart';

import '../screens/employee.dart';

class SalaryTile extends StatelessWidget {
  final DocumentSnapshot data;

  const SalaryTile({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return EditSalary(data: data);
            });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromRGBO(248, 156, 46, 1),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Color.fromRGBO(194, 194, 194, 100),
            )
          ],
        ),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.025,
          bottom: MediaQuery.of(context).size.width * 0.025,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: ResizeImage(NetworkImage(data['image']),
                          width: 30, height: 30),
                      radius: 30,
                    ),
                  ),
                  Text(
                    data['name'],
                    style: const TextStyle(
                        color: Color.fromRGBO(248, 156, 46, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Text(
                '₹${data['salary']}',
                style: const TextStyle(
                  color: Color.fromRGBO(58, 18, 45, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
