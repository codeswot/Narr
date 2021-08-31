import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DocumentConvertion extends StatefulWidget {
  @override
  _DocumentConvertionState createState() => _DocumentConvertionState();
}

class _DocumentConvertionState extends State<DocumentConvertion> {
  String docConvertUrl = '$baseUrl/doc';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String filePicked = '';
  bool isClickable = false;
  String selectedFile = '';
  late Response response;

  List<String> docConvertionExtensions = [
    'doc',
    'docx',
    'txt',
    'odt',
    'rft',
    'xlsx',
  ];

  void dropFile() {
    setState(() {
      narrService.utilityService.fileName = '';
      narrService.utilityService.fileExtension = '';
      narrService.utilityService.selectedfile = '';
    });

    setState(() {
      flag = false;
    });
  }

  @override
  void initState() {
    narrService.permissionService.requestPermission();
    super.initState();
  }

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    // checkPercent();
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(
                  'How To Use',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                          'Select a document with valid extension i.e .doc, .docx, .txt'),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5),
                    Flexible(
                        child: Text(
                            'Click on the convert button to convert the document')),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                          'Check phone storage and your document will be in the NARR folder'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 300,
                  child: SvgPicture.asset(
                    'assets/svg/document.svg',
                  ),
                ),
                flag
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              '${narrService.utilityService.fileName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => dropFile(),
                            child: Icon(Icons.close),
                          ),
                          SizedBox(width: 10),
                        ],
                      )
                    : Container(),
                SizedBox(height: 20),
                flag
                    ? PrimaryRaisedButton(
                        buttonTitle: 'Convert',
                        onTap: (startLoading, stopLoading, btnState) async {
                          setState(() {
                            flag = true;
                          });

                          startLoading();
                          narrService.uploadService
                              .documentConvertion(
                            filePath: narrService.utilityService.selectedfile,
                            fileName: narrService.utilityService.fileName,
                            context: context,
                            url: docConvertUrl,
                          )
                              .then((value) {
                            flag = false;
                            stopLoading();
                            narrService.dialogInfoService.showDialog(
                              title: 'SUCCESS',
                              subtitle:
                                  '${narrService.utilityService.fileName} has been converted',
                              alertType: AlertType.success,
                              context: context,
                            );
                          });
                          setState(() {});
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await narrService.utilityService
              .selectDoc(allowedExtensions: docConvertionExtensions);
          setState(() {
            flag = true;
          });
        },
        label: Text('Select a file'),
        icon: Icon(Icons.attach_file),
      ),
    );
  }
}
