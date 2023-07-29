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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color.fromRGBO(248, 156, 46, 1), width: 2),
            bottom:
                BorderSide(color: Color.fromRGBO(248, 156, 46, 1), width: 1),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Color.fromRGBO(194, 194, 194, 100),
            ),
          ],
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
