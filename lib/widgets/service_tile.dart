import 'package:flutter/material.dart';
import 'package:manager/constants/text_decoration.dart';

class ServiceTile extends StatelessWidget {
  final String name;
  final Function()? onPressed;
  const ServiceTile({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.075,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.010),
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
        decoration: const BoxDecoration(
          color: Color(0xFFf6f6f6),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Color.fromRGBO(194, 194, 194, 100),
            )
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
