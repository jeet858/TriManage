import 'package:flutter/material.dart';
import 'package:manager/screens/employee_list.dart';
import 'package:manager/widgets/bottom_navigationbar.dart';
import 'package:manager/widgets/service_tile.dart';

class HR extends StatelessWidget {
  const HR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomApp(),
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
          const ServiceTile(name: 'Recruitments', onPressed: null),
          const ServiceTile(name: 'All Applications', onPressed: null),
          const ServiceTile(name: 'FAQ', onPressed: null)
        ],
      ),
    );
  }
}
