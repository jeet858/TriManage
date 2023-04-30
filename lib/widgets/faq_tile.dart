import 'package:flutter/material.dart';
import 'package:manager/constants/text_decoration.dart';

class FAQTile extends StatelessWidget {
  final String name;
  final Function()? onPressed;
  const FAQTile({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: const BoxDecoration(
          color: Color(0xFFf6f6f6),
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              style: BorderStyle.solid,
            ),
            top: BorderSide(
              color: Colors.black,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Text(
          name,
          style: kTextStyle.copyWith(color: Colors.black),
          overflow: TextOverflow.fade,
          maxLines: 5,
        ),
      ),
    );
  }
}
