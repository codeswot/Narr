import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class UtilityService {
  Future selectDate(BuildContext context) async {
    dynamic selectedDate;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960, 1),
        lastDate: DateTime.now());
    if (picked != null) {
      selectedDate = picked;
      // isPicked = true;
      //get
    }
    return selectedDate;
  }

  List<DropdownMenuItem> getInstitutionNameDropdownItems(List institutionName) {
    List<DropdownMenuItem<dynamic>> dropdowmItems = [];

    for (var name in institutionName) {
      var newItem = DropdownMenuItem(
        child: Text(name['name']),
        value: name['name'],
      );

      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List getTagItem(List itemList) {
    List<String> tagItems = [];
    for (var item in itemList) {
      var newItem = item.title;
      tagItems.add(newItem);
    }
    return tagItems;
  }

//
  Future pickImage(
      {required ImageSource imageSource,
      required ImagePicker picker,
      required File pickedImage,
      required String pickedSImage}) async {
    final pickedFile =
        await picker.getImage(source: imageSource, imageQuality: 30);
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      pickedSImage = pickedFile.path;
      print('Picked String file :: $pickedSImage');
    }

    return pickedSImage;
  }

  String selectedfile = '';
  String fileExtension = '';
  String fileName = '';
  Future<String> selectDoc({
    required List<String> allowedExtensions,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      onFileLoading: (val) {},
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      fileName = result.files.first.name;
      selectedfile = result.files.first.path!;
      fileExtension = result.files.first.extension!;
      print('File Name $selectedfile');
      print('File Extension: $fileExtension');
    }
    return fileName;
  }

  int amountFormarter(String ammount) {
    bool startsWithCurrency = ammount.startsWith('₦');
    bool startsWithNarr = ammount.startsWith('Narr');

    if (startsWithCurrency || startsWithNarr) {
      String removeCurrency = ammount.replaceAll('₦', '');
      print('$ammount ==> $removeCurrency');
      String removeDot = removeCurrency.replaceAll('.', '');
      String removedComma = removeDot.replaceAll(',', '');
      String finalAmountFormart = removedComma.replaceAll('Narr', '');

      print('$removeCurrency ==> $finalAmountFormart');
      int _finalAmout = int.parse(finalAmountFormart);
      return _finalAmout;
    } else {
      return 0;
    }
  }

  String convertToNarrCoin(num naira) {
    num value = naira / 1000000;
    final String finalValue = value.toString();
    return finalValue;
  }

  String convertToNaira(num naira) {
    num value = naira * 100;
    final String finalValue = value.toString();
    return finalValue;
  }

  void launchURL(linkUrl) async => await canLaunch(linkUrl)
      ? await launch(linkUrl)
      : throw 'Could not launch $linkUrl';
  String dateFormatting(date) {
    return DateFormat('yyyy-MM-dd – kk:mm:a').format(date);
  }

  String numberFormatting(double number) {
    return NumberFormat.decimalPattern().format(number);
  }
}
