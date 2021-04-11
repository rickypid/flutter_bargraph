# flutter_bargraph

[![Pub Package](https://img.shields.io/pub/v/flutter_bargraph.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_bargraph) [![Package Issue](https://img.shields.io/github/issues/rickypid/flutter_bargraph)](https://github.com/rickypid/flutter_bargraph/issues)
![Package License](https://img.shields.io/github/license/rickypid/flutter_bargraph)

Flutter Single value bar graph viewer with indicators

| ![Image](https://github.com/rickypid/flutter_bargraph/blob/7f5bde4ebc40899079800127c815e01beac3abcb/doc/.media/example.gif?raw=true) |
| :------------: |
| **BarGraph** |

## Features

* Min/Max property
* Customizable colors and text style 
* Vertical orientation, left to right and right to left direction
* Horizontal orientation, top to bottom and bottom to top direction
* Number of divisions customizable

## Usage

Make sure to check out [examples](https://github.com/rickypid/flutter_bargraph/tree/master/exmple).

### Installation

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  flutter_bargraph: ^0.1.0-alpha
```

### Basic setup

*The complete example is available [here](https://github.com/rickypid/flutter_bargraph/blob/master/exmple/lib/main.dart).*

**BarGraph** requires you to provide `min`, `max` and `value`:
* `min` is the min value of BarGraph scale.
* `max` is the max value of BarGraph scale.
* `value` is the currently value of BarGraph scale.

```dart
BarGraph(
    min: 0,
    max: 100.0,
    value: 65.0,
);
```

### Advanced options

#### Style

* `orientation` is the scale orientation, default vertical from bottom.
* `indicatorStyle` is the scale indicators style, default BOTH, left and right.
* `indicatorSpacing` is the scale indicators spacing, default SPACE_AROUND, alternative SPACE_BETWEEN.

#### Colors

* `backgroundColor` is the background color og BarGraph.
* `barColor` is the color of actual value bar.
* `indicatorsColor` is the color of indicators scale.

#### Indicators text

* `textStyle` is the TextStyle of indicators text.
* `textAlign` is the Alignment of indicators text.
* `fractionDigits` is the number of fraction digits visible.
* `divisions` is the number of divisions of scale.
* `textFlex` is the percentage of portion used for text, remaining space is used for indicators.


#### Animation

* `animationDuration` in milliseconds, it's duration time of animation when actual value changed.


#### Example

| ![Image](https://github.com/rickypid/flutter_bargraph/blob/master/doc/.media/example_space_around.png?raw=true) | ![Image](https://github.com/rickypid/flutter_bargraph/blob/master/doc/.media/example_space_around_horizontal.png?raw=true) | ![Image](https://github.com/rickypid/flutter_bargraph/blob/master/doc/.media/example_space_between.png?raw=true) |
| :------------: | :------------: | :------------: |
| **Vertical space around** | **Horizontal space around** | **Vertical space between space around** |





