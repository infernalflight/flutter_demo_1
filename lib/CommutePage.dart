import 'package:flutter/material.dart';

class CommutePage extends StatelessWidget
{
  final String bonjour;

  CommutePage(this.bonjour);


  @override
  Widget build(BuildContext context) {

    //final String _arg = ModalRoute.of(context)!.settings.arguments as String;


    return Scaffold(
      appBar: AppBar(
        title: Text('Commute Page'),
      ),
      body: Center(
        child: Text(bonjour),
      ),
    );
  }
}