import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/models/citation_model.dart';
import 'package:narr/shared/screens/research_screens/citation_dialog.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/forms/Text_field_container.dart';
import 'package:narr/shared/widgets/forms/dropdown_items.dart';

class ResearchUpload extends StatefulWidget {
  @override
  _ResearchUploadState createState() => _ResearchUploadState();
}

class _ResearchUploadState extends State<ResearchUpload> {
  final _formKey = GlobalKey<FormState>();

  List<String> researchDocExtensions = [
    'doc',
    'docx',
    'pdf',
    'odt',
  ];

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController fee = TextEditingController();

  final List<CitationModel> _addedCitations = <CitationModel>[];
  DropdownItem _dropdownItem = DropdownItem();
  final List<dynamic> categories = <dynamic>[
    "Arts",
    "Education",
    "Engineering",
    "Sciences",
    "Social sciences",
  ];
  List<String> addedAuthors = <String>[];
  List<CitationModel> addedCitations = <CitationModel>[];
  List addedCategories = [];

  //
  bool flag = false;
  double progress = 0;
  int bytesSent = 0;
  int bytesTotal = 0;

  void onSendProgress(int sent, int total) {
    double percentage = (sent / total * 100);
    setState(() {
      bytesSent = sent;
      bytesTotal = total;
      progress = percentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Research',
        ),
      ),
      // ignore: unnecessary_null_comparison
      body: narrService.utilityService.selectedfile != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryCard(
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 90,
                            child: SvgPicture.asset('assets/svg/uploading.svg'),
                          ),
                        ),
                        SizedBox(height: 8),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Research Title is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Research Title',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                controller: title,
                              ),
                              SizedBox(height: 14),
                              TextFormField(
                                maxLines: 5,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Description of publication is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Research Description',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                controller: description,
                              ),
                              SizedBox(height: 14),
                              TextFormField(
                                controller: authorController,
                                validator: (value) {
                                  if (addedAuthors.isEmpty) {
                                    return 'at least one authors is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: authorController.text.length >= 3
                                      ? Container(
                                          width: 100,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    addedAuthors.add(
                                                        authorController.text);
                                                    authorController.clear();
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    'Add author',
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: NarrColors
                                                            .royalGreen),
                                                  ),
                                                ),
                                              )),
                                        )
                                      : Container(width: 10),
                                  border: InputBorder.none,
                                  hintText: 'Authors',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                                onFieldSubmitted: (String value) {
                                  addedAuthors.add(value);
                                  authorController.clear();
                                  setState(() {});
                                },
                                textInputAction: TextInputAction.go,
                                textCapitalization: TextCapitalization.words,
                              ),
                              // SizedBox(height: 14),
                              Wrap(
                                children: addedAuthors
                                    .map((String author) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Chip(
                                            label: Text(author),
                                            deleteButtonTooltipMessage:
                                                'Remove Author',
                                            onDeleted: () {
                                              addedAuthors.remove(author);
                                              setState(() {});
                                            },
                                          ),
                                        ))
                                    .toList(),
                              ),
                              SizedBox(height: 14),
                              //citation
                              ElevatedButton(
                                child: Text('Add Citation'),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CitationDialog(),
                                  ).then((value) {
                                    var newCitation = value;
                                    _addedCitations.add(newCitation);
                                    setState(() {});
                                  });
                                },
                              ),
                              SizedBox(height: 14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Added Citations'),
                                  Divider(),
                                  SizedBox(height: 8),
                                  _addedCitations.isNotEmpty
                                      ? Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 0.1)),
                                          child: DataTable(
                                            columns: [
                                              DataColumn(label: Text('Name')),
                                              DataColumn(label: Text('Year')),
                                              DataColumn(label: Text('Website'))
                                            ],
                                            rows: _addedCitations
                                                .map((CitationModel
                                                        citations) =>
                                                    DataRow(
                                                      cells: [
                                                        DataCell(Text(citations
                                                            .fullName)),
                                                        DataCell(Text(
                                                            citations.date)),
                                                        DataCell(
                                                          Container(
                                                            width: 70,
                                                            height: 20,
                                                            child: Text(
                                                              citations.url,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ))
                                                .toList(),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),

                              SizedBox(height: 14),
                              MultiSelectBottomSheetField(
                                decoration:
                                    BoxDecoration(color: Colors.grey[200]),
                                validator: (value) {
                                  if (value == null) {
                                    return 'at least one category is required';
                                  }
                                  return null;
                                },
                                searchable: true,
                                title: Text('Categories'),
                                buttonText: Text('Categories'),
                                buttonIcon: Icon(Icons.arrow_drop_down),
                                items: categories
                                    .map((e) => MultiSelectItem(e, e))
                                    .toList(),
                                listType: MultiSelectListType.CHIP,
                                onConfirm: (values) {
                                  setState(() {
                                    addedCategories = values;
                                  });
                                },
                              ),
                              SizedBox(height: 14),
                              TextFieldContainer(
                                child: DropdownButtonFormField<dynamic>(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select a genre';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  hint: Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      'Genres',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                  items: _dropdownItem.getGenreDropdownItems(),
                                  onChanged: (value) {
                                    setState(() {
                                      _dropdownItem.selectedGenre = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              TextFieldContainer(
                                child: DropdownButtonFormField<dynamic>(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select Access Type';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  hint: Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      'Access Type',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                  items: _dropdownItem
                                      .getaccessTypeDropdownItems(),
                                  onChanged: (value) {
                                    setState(() {
                                      _dropdownItem.selectedAccessType = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 14),
                              _dropdownItem.selectedAccessType ==
                                      _dropdownItem.accessType[1]
                                  ? TextField(
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Monthly Fess',
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                      ),
                                      controller: fee,
                                    )
                                  : Container(),
                              SizedBox(height: 15),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Year of publication is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Year of Publication',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                controller: year,
                                keyboardType: TextInputType.datetime,
                              ),
                              SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  narrService.utilityService
                                      .selectDoc(
                                          allowedExtensions:
                                              researchDocExtensions)
                                      .then((value) {
                                    setState(() {});
                                  });
                                },
                                child: TextFieldContainer(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: narrService
                                                .utilityService.selectedfile ==
                                            ''
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Select File'),
                                              Icon(Icons.attach_file),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(narrService
                                                  .utilityService.fileName),
                                              InkWell(
                                                onTap: () {
                                                  narrService.utilityService
                                                      .selectedfile = '';
                                                  setState(() {});
                                                },
                                                child: Icon(Icons.delete),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        PrimaryRaisedButton(
                          buttonTitle: 'Upload',
                          onTap: (startLoading, stopLoading, btnState) async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (narrService.utilityService.selectedfile ==
                                  '') {
                                narrService.dialogInfoService
                                    .showToast('Please select a file');
                              } else {
                                startLoading();
                                narrService.uploadService.researchUpload(
                                    url: '$narrUrl/research/upload',
                                    requestBody: {
                                      'meta': jsonEncode(<String, String>{
                                        'researchTitle': title.text,
                                        'description': description.text,
                                        'authors': '$addedAuthors',
                                        'category': '$addedCategories',
                                        'citations': '$addedCitations',
                                        'genre': _dropdownItem.selectedGenre,
                                        'accessType':
                                            _dropdownItem.selectedAccessType,
                                        'monthlyFee':
                                            '${fee.text.isEmpty ? 0 : fee.text}',
                                        'year': year.text,
                                        'ownerEmail': currentUser.user.email,
                                      }),
                                      'file': MultipartFile.fromFile(
                                        narrService.utilityService.selectedfile,
                                        filename:
                                            narrService.utilityService.fileName,
                                      ),
                                    }).then((value) {
                                  setState(() {});
                                  print(value);
                                  stopLoading();
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    await narrService.utilityService.selectDoc(
                      allowedExtensions: researchDocExtensions,
                    );
                    setState(() {
                      flag = false;
                    });
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Center(
                            child: Text(
                              'Click the upload file \n button to start \n upload proccess.',
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.grey.shade900.withOpacity(0.25),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.file_upload,
                          color: Color(0xff00a368),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Recent Uploads:'),
                    ),
                  ],
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
