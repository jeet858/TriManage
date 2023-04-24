import 'package:flutter/material.dart';
import 'package:manager/screens/fleet_management.dart';
import 'package:manager/screens/inventory_management.dart';
import 'package:manager/widgets/bottom_navigationbar.dart';

import 'hr_management.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomApp(),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HR()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 200,
                      color: const Color.fromRGBO(248, 156, 46, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'HR\nManagement',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'poppins'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 120,
                            height: 2,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 20),
                            width: 100,
                            height: 1.5,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              'assets/images/Frame.png',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Inventory()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 200,
                      color: const Color.fromRGBO(76, 110, 71, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Inventory\nManagement',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'poppins'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 120,
                            height: 2,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 20),
                            width: 100,
                            height: 1.5,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              'assets/images/Parcel.png',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: MediaQuery.of(context).size.width * 0.35,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 200,
                      color: const Color.fromRGBO(226, 74, 67, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Fleet\nManagement',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'poppins'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 120,
                            height: 2,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 20),
                            width: 100,
                            height: 1.5,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              'assets/images/Truck.png',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
