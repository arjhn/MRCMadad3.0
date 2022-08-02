import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceCalendarPick{

  late TextEditingController _dateController;

  ServiceCalendarPick(){
    _dateController=TextEditingController();
  }

  Future<String> datePick(BuildContext context) async{
    final initialDate=DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate, firstDate: DateTime(1947,1,1), lastDate: DateTime.now()
    );
    if(newDate==null) return '';
    _dateController.text=DateFormat('yyyy-MM-dd').format(newDate);
    return _dateController.text;
  }
}