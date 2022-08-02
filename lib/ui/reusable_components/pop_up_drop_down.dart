import 'package:flutter/material.dart';

class BasicPopMenuButton extends StatefulWidget {

  final List<String> valueList;
  final IconData iconData;
  final Function(String) onSelectChange;
  final String initialValue;

  const BasicPopMenuButton({
    Key? key,
    required this.valueList,
    required this.iconData,
    required this.onSelectChange,
    required this.initialValue
  }) : super(key: key);

  @override
  _BasicPopMenuButtonState createState() => _BasicPopMenuButtonState();
}

class _BasicPopMenuButtonState extends State<BasicPopMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue:widget.initialValue,
      icon: Icon(widget.iconData),
      onSelected: (String value) => widget.onSelectChange(value),
      itemBuilder: (BuildContext context){
        return widget.valueList.map<PopupMenuItem<String>>((String value){
          return new PopupMenuItem(child: new Text(value),value: value,);
        }).toList();
      },
    );
  }
}
