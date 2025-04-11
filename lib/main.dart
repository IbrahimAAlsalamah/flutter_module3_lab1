import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Example'),
          backgroundColor: Colors.red,
        ),
        body: MyForm()
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final Logger _logger = Logger();

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.start, color: Colors.red,),
              Icon(Icons.star, color: Colors.black,),
              Icon(Icons.dangerous, color: Colors.red,)
            ],
          ),
          Text('Welcome to Flutter!'),
          TextField(
            decoration: InputDecoration(labelText: 'Enter your name'),
          ),
          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                _logger.i('Form is valid');
                _showAlertDialog(context, 'Form submitted', 'User input is logged');
              }
              return;
            },
            child: const Text('Submit')
          )
        ],
      ),

    );
  }
}