import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/recruitment_files.dart';

class AllApplications extends StatefulWidget {
  const AllApplications({Key? key}) : super(key: key);

  @override
  State<AllApplications> createState() => _AllApplicationsState();
}

class _AllApplicationsState extends State<AllApplications> {
  final storage = FirebaseStorage.instance;

  Future<List<Map>> getPdfUrls() async {
    final List<Map> pdfUrls = [];
    final ListResult result =
        await FirebaseStorage.instance.ref().child('/applications').listAll();
    for (final ref in result.items) {
      final url = await ref.getDownloadURL();
      pdfUrls.add({'name': ref.name, 'link': url});
    }
    return (pdfUrls);
  }

  Future<void> openFileManagerAndSelectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String fileName = result.files.first.name;
      // Upload file
      final storageRef = FirebaseStorage.instance.ref().child('/applications');
      final uploadFileRed = storageRef.child('/$fileName');
      String filePath = '${result.files.first.path}';
      File file = File(filePath);
      try {
        await uploadFileRed.putFile(file);
      } catch (e) {}
    } else {}
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text('When you add a new file it will take '
                'some time to reflect the changes and its better to '
                'refresh the screen after a few seconds'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: getPdfUrls().asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              default:
                final pdfUrls = snapshot.data!;
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: pdfUrls.map((element) {
                    return RecruitmentFiles(
                        link: element['link'], name: element['name']);
                  }).toList(),
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await openFileManagerAndSelectFile();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
