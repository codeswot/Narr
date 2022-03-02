import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tags/flutter_tags.dart';

class MultiInputTextField extends StatefulWidget {
  const MultiInputTextField(
      {required this.inputs, required this.hintText, this.icon});
  final List inputs;
  final String hintText;
  final IconData? icon;

  @override
  _MultiInputTextFieldState createState() => _MultiInputTextFieldState();
}

class _MultiInputTextFieldState extends State<MultiInputTextField> {
  @override
  Widget build(BuildContext context) {
    return Tags(
      textField: TagsTextField(
          width: double.infinity,
          hintText: widget.hintText,
          textStyle: TextStyle(fontSize: 16),
          inputDecoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(widget.icon),
          ),
          onSubmitted: (item) {
            setState(() {
              widget.inputs.add(
                Item(title: item, active: true),
              );
            });
          }),
      itemCount: widget.inputs.length,
      itemBuilder: (int index) {
        final item = widget.inputs[index];

        return ItemTags(
          key: Key(index.toString()),
          index: index, // required
          title: item.title,
          active: item.active,
          activeColor: Colors.green,
          color: Colors.green,
          customData: item.customData,
          combine: ItemTagsCombine.withTextBefore,
          removeButton: ItemTagsRemoveButton(
            onRemoved: () {
              setState(() {
                widget.inputs.removeAt(index);
              });
              return true;
            },
          ),
          onPressed: (item) => print(item),
          onLongPressed: (item) => print(item),
        );
      },
    );
  }
}
