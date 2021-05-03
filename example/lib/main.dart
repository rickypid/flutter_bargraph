import 'package:flutter/material.dart';
import 'package:flutter_bargraph/flutter_bargraph.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarGraph',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'BarGraph'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = ''}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
                    barColor: Theme.of(context).accentColor,
                    orientation: BarGraphOrientation.HORIZONTAL_FROM_LEFT,
                  )),
                  Expanded(
                      child: BarGraph(
                    min: 0,
                    max: 100,
                    divisions: 5,
                    value: _currentSliderValue,
                    barColor: Theme.of(context).accentColor,
                    orientation: BarGraphOrientation.VERTICAL_FROM_BOTTOM,
                    indicatorSpacing: BarGraphIndicatorSpacing.SPACE_BETWEEN,
                  )),
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
