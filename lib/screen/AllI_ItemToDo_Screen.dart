import 'package:flutter/material.dart';

class All_ItemToDo_Screen extends StatefulWidget {
  @override
  _DummyWidgetState createState() => _DummyWidgetState();
}

class _DummyWidgetState extends State<DummyWidget> {
  bool _isGreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isGreen ? Colors.green : Colors.red,
      appBar: AppBar(
        title: Text('Your First App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  _isGreen = !_isGreen;
                });
              },
              child: Text(_isGreen ? 'TURN RED' : 'TURN GREEN'),
            ),
          ],
        ),
      ),
    );
  }
}