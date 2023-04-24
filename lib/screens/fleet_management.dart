import 'package:flutter/material.dart';
import 'package:manager/widgets/bottom_navigationbar.dart';

class Fleet extends StatelessWidget {
  const Fleet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomApp(),
    );
  }
}
