import 'package:flutter/material.dart';

import 'datafolder/data_service.dart';

import 'datafolder/data_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  var _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Column(
                children: [
                  Image.network(_response.iconUrl),
                  Text(
                    '${_response.tempInformation.temp}°',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(_response.weatherInformation.description)
                ],
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center),
              ),
            ),
            ElevatedButton(onPressed: _search, child: Text('Search'))
          ],
        ),
      ),
    ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
