import 'package:flutter/material.dart';

class UtilityService {
  Future selectDate(BuildContext context) async {
    dynamic selectedDate;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990, 1),
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
}
