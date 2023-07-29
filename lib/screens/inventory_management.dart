import 'package:flutter/material.dart';
import 'package:manager/widgets/service_tile.dart';

import '../widgets/bottom_navigationbar.dart';

class Inventory extends StatelessWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomApp(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [],
      ),
    );
  }
}
