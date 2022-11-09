import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myAppState();
  }
}

class _myAppState extends State<MyApp> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Choose a color',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: color,
            ),
            body: Column(
              children: [
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 28,
                        color: color,
                        backgroundColor: color,
                      ),
                      textAlign: TextAlign.center,
                    )),
                ElevatedButton(
                    onPressed: () => setState(() {
                          color = Colors.blue;
                        }),
                    child: const Text('Blue')),
                ElevatedButton(
                    onPressed: () => setState(() {
                          color = Colors.red;
                        }),
                    child: const Text('Red')),
                ElevatedButton(
                    onPressed: () => setState(() {
                          color = Colors.green;
                        }),
                    child: const Text('Green')),
              ],
            )));
  }
}
