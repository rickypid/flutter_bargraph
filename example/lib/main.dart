// Flutter imports:
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bargraph/flutter_bargraph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarGraph',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BarGraph'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title = ''}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BarGraph(
                      min: 0,
                      max: 100,
                      divisions: 4,
                      value: _currentSliderValue,
                      barColor: Theme.of(context).colorScheme.secondary,
                      orientation: BarGraphOrientation.horizontalFromLeft,
                    ),
                  ),
                  Expanded(
                    child: BarGraph(
                      min: 0,
                      max: 100,
                      divisions: 5,
                      value: _currentSliderValue,
                      barColor: Theme.of(context).colorScheme.secondary,
                      orientation: BarGraphOrientation.verticalFromBottom,
                      indicatorSpacing: BarGraphIndicatorSpacing.spaceBetween,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 20,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
