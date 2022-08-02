import 'package:flutter/material.dart';

class DropDownUnderLine extends StatefulWidget {

  final List<String> dropField;
  final TextEditingController controllerDDT;
  final String labelTextString;
  final Function(String) callOnChange;
  final String dropDownVal;

  const DropDownUnderLine({
    Key? key,
    required this.dropField,
    required this.controllerDDT,
    required this.labelTextString,
    required this.callOnChange,
    required this.dropDownVal,
  }) : super(key: key);

  @override
  _DropDownUnderLineState createState() => _DropDownUnderLineState();
}

class _DropDownUnderLineState extends State<DropDownUnderLine> {

  late List<String> dropFieldState;
  late String dropdownValue;

  @override
  void initState(){
    dropFieldState=widget.dropField;
    dropdownValue=widget.dropDownVal;
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      items: dropFieldState.map((String item){
        return DropdownMenuItem(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(item),
            )
        );
      }).toList(),
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      onChanged: (String? newValue){
        setState(() {
          dropdownValue=newValue ?? 'English';
        });
        widget.callOnChange(newValue ?? 'English');
      },
    );
  }
}