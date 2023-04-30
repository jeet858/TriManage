import 'package:flutter/material.dart';
import 'package:manager/screens/all_applications.dart';
import 'package:manager/screens/employee_list.dart';
import 'package:manager/screens/faqs.dart';
import 'package:manager/screens/recruitments.dart';
import 'package:manager/widgets/bottom_navigationbar.dart';
import 'package:manager/widgets/service_tile.dart';

class HR extends StatelessWidget {
  const HR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ServiceTile(
              name: 'Employee Data',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmployeeList()));
              }),
          ServiceTile(
              name: 'Recruitments',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Recruitments()));
              }),
          ServiceTile(
              name: 'All Applications',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllApplications()));
              }),
          ServiceTile(
              name: 'FAQ',
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FAQ()));
              }),
        ],
      ),
    );
  }
}
