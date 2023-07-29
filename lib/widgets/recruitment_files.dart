import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class RecruitmentFiles extends StatelessWidget {
  final String link;

  final String name;

  const RecruitmentFiles({Key? key, required this.link, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SfPdfViewer.network(link),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromRGBO(58, 18, 45, 1),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Color.fromRGBO(194, 194, 194, 100),
            )
          ],
        ),
        child: Text(name),
      ),
    );
  }
}
