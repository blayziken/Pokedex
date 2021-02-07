import 'package:flutter/material.dart';

class DetailTab extends StatelessWidget {
  String title;

  DetailTab(this.title);

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(
      title,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ));
  }
}
