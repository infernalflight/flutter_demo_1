import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/Todo.dart';

class CommutePage extends StatefulWidget
{
  final String bonjour;
  late List<Todo> _todos = [];


  CommutePage(this.bonjour);

  @override
  State<CommutePage> createState() => _CommutePageState();
}

class _CommutePageState extends State<CommutePage> {

  Future<void> apiCall() async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1/todos'));
    if (response.statusCode == 200) {
      var todos = List<Todo>.from(jsonDecode(response.body).map((data) => Todo.fromJson(data)).toList());
      setState(() {
        widget._todos = todos;
      });
    }

  }


  @override
  Widget build(BuildContext context) {

    //final String _arg = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Api Page'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: apiCall,
              child: Text('Appel Api')
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget._todos.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text(widget._todos[index].name),
                    leading: widget._todos[index].completed ? Icon(Icons.check) : Icon(Icons.check_box_outline_blank) ,
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}