import 'package:flutter/material.dart';
import 'package:hello/provider/CompteurProvider.dart';
import 'package:provider/provider.dart';

class SecondCounter extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    final _compteurProvider = context.watch<CompteurProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Compteur page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Compteur : ${_compteurProvider.compteur}'),
            ElevatedButton(
                onPressed: () {
                  _compteurProvider.increment();
                },
                child: Text('Incrémenter')
            )
          ],
        ),
      )
    );
  }

}