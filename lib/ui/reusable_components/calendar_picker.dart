import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPicker extends StatefulWidget {

  final TextEditingController controllerDP;
  final String labelText;
  final bool validateField;
  final String dateString;

  const CalendarPicker({
    Key? key,
    required this.labelText,
    required this.controllerDP,
    this.validateField=false,
    this.dateString=''
  }) : super(key: key);

  @override
  _CalendarPickerState createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {

  @override
  void initState(){
    super.initState();
    if(widget.dateString!='')
      widget.controllerDP.text=widget.dateString;
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14)
            ),
            labelText: widget.labelText,
            hintText: widget.labelText,
            errorText: widget.validateField? 'Value Can\'t Be Empty' : null,
            prefixIcon: Icon(Icons.history),
            suffixIcon: IconButton(
              icon: Icon(Icons.today),
              onPressed: ()=> _datePick(),
            )
        ),
        controller: widget.controllerDP,
      ),
    );
  }

  Future _datePick() async{
    final initialDate=DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate, firstDate: DateTime(1947,1,1), lastDate: DateTime.now()
    );
    if(newDate==null) return;
    widget.controllerDP.text=DateFormat('yyyy-MM-dd').format(newDate);
  }
}
