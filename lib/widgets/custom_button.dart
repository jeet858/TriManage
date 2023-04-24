import 'package:flutter/material.dart';
import 'package:manager/constants/text_decoration.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String name;
  final Color color;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.name,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        width: 200,
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        alignment: Alignment.center,
        child: Text(
          name,
          style: kTextStyle,
        ),
      ),
    );
  }
}
