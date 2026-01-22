import 'package:flutter/material.dart';

class CommutePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    final String _arg = ModalRoute.of(context)!.settings.arguments as String;


    return Scaffold(
      appBar: AppBar(
        title: Text('Commute Page'),
      ),
      body: Center(
        child: Text(_arg),
      ),
    );
  }
}