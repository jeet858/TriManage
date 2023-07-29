import 'package:flutter/material.dart';
import 'package:manager/constants/text_decoration.dart';

class ServiceTile extends StatelessWidget {
  final String name;
  final Function()? onPressed;
  final Color iconColor;
  final IconData icon;
  const ServiceTile(
      {Key? key,
      required this.name,
      required this.onPressed,
      required this.iconColor,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.2,
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.010),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Color.fromRGBO(194, 194, 194, 100),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: iconColor, width: 2),
              ),
              child: Icon(
                icon,
                size: 40,
                color: iconColor,
              ),
            ),
            Text(
              name,
              style: kTextStyle.copyWith(color: Colors.black),
              overflow: TextOverflow.fade,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
