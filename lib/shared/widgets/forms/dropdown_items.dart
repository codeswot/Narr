import 'package:flutter/material.dart';

class DropdownItem {
  String selectedCategory = '';
  String selectedGenre = '';
  String selectedAccessType = '';
  String selectedFilter = '';

  List<String> independentResearcher = ['Researcher', 'Publisher'];

  List<String> filters = [
    'Science',
    'Art',
    'Law',
    'Engineering',
    'Social Science',
    'Technology'
  ];

  List<String> category = [
    'Arts',
    'Education',
    'Engineering',
    'Social Sciences',
    'Sciences'
  ];

  List<String> genres = ['Project', 'Thesis-Dissertation', 'Journal', 'eBook'];

  List<String> accessType = [
    'Free',
    'Paid',
  ];

  List<DropdownMenuItem> getIndependentResearcherName() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String name in independentResearcher) {
      var newItem = DropdownMenuItem(
          child: Text(
            name,
          ),
          value: name);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<DropdownMenuItem> getCategoryDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String cat in category) {
      var newItem = DropdownMenuItem(
        child: Text(cat),
        value: cat,
      );
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<DropdownMenuItem> getGenreDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String gen in genres) {
      var newItem = DropdownMenuItem(
        child: Text(gen),
        value: gen,
      );
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<DropdownMenuItem> getaccessTypeDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String type in accessType) {
      var newItem = DropdownMenuItem(
        child: Text(type),
        value: type,
      );
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }
}
