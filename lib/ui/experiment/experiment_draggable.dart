import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperimentDraggable extends StatefulWidget {
  const ExperimentDraggable({Key? key}) : super(key: key);

  @override
  _ExperimentDraggableState createState() => _ExperimentDraggableState();
}

class _ExperimentDraggableState extends State<ExperimentDraggable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Bar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
        ],
      )
    );
  }
}
