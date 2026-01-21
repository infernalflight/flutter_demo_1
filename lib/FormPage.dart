import 'package:flutter/material.dart';

class FormPage extends StatefulWidget
{

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  var _formKey = GlobalKey<FormState>();
  bool _switchValue = false;
  String? _radioGroupValue;
  String? _dropdownValue;


  String? _validateEmail(String? value) {
    if(value!.isEmpty) {
      return 'Ce champs est obligatoire';
    }

    if(value.length < 3) {
      return 'Votre email est trop court !!';
    }

    if (!RegExp(r"(^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$)").hasMatch(value)) {
      return 'Veuillez saisir un email valable !!';
    }

    return null;
  }

  void _onSubmit() {
    if(_formKey.currentState!.validate()) {
        print(_switchValue);
        print(_radioGroupValue);
        print(_dropdownValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hint: Text('Veuillez Saisir votre email'),
              border: OutlineInputBorder(),
            ),
            validator: _validateEmail,
          ),
          SwitchListTile(
              secondary: Icon(Icons.newspaper_outlined),
              title: Text('Accepter les termes'),
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              }
          ),
          RadioGroup(
              groupValue: _radioGroupValue,
              onChanged: (value) {
                setState(() {
                  _radioGroupValue = value;
                });
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text('Choix 1'),
                    leading: Radio<String>(
                      value: 'choix_1',
                    )
                  ),
                  ListTile(
                      title: Text('Choix 2'),
                      leading: Radio<String>(
                        value: 'choix_2',
                      )
                  ),
                  ListTile(
                      title: Text('Choix 3'),
                      leading: Radio<String>(
                        value: 'choix_3',
                      )
                  )
                ]
              )
          ),
          DropdownMenu(
              initialSelection: _dropdownValue,
              dropdownMenuEntries: [
                DropdownMenuEntry(
                    value: 'red',
                    label: 'Rouge'
                ),
                DropdownMenuEntry(
                    value: 'green',
                    label: 'Vert'
                ),
                DropdownMenuEntry(
                    value: 'blue',
                    label: 'Bleu'
                )
              ],
            onSelected: (value) {
              _dropdownValue = value;
            },
          ),
          ElevatedButton(
              onPressed: _onSubmit,
              child: Text('OK')
          )
        ],
      ),
    );
  }
}