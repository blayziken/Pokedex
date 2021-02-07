import 'package:flutter/material.dart';

class Moves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(100),
      child: Center(
        child: Text(
          'Nothing to see here yet!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
