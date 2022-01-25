# flutter_bargraph

[![Pub Package](https://img.shields.io/pub/v/flutter_bargraph.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_bargraph)
[![likes](https://badges.bar/flutter_bargraph/likes)](https://pub.dev/packages/flutter_bargraph/score)
[![popularity](https://badges.bar/flutter_bargraph/popularity)](https://pub.dev/packages/flutter_bargraph/score)
[![pub points](https://badges.bar/flutter_bargraph/pub%20points)](https://pub.dev/packages/flutter_bargraph/score)

[![Package Issue](https://img.shields.io/github/issues/rickypid/flutter_bargraph)](https://github.com/rickypid/flutter_bargraph/issues)
![Package License](https://img.shields.io/github/license/rickypid/flutter_bargraph)

Bar Graph Indicator for Flutter. It graphically displays the current value on a bar graph and manages its animation when the value changes. you can customize the orientation and direction of the bar.

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

Make sure to check out [examples](https://github.com/rickypid/flutter_bargraph/tree/master/example).

### Installation

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  flutter_bargraph: ^1.1.0
```

### Basic setup

*The complete example is available [here](https://github.com/rickypid/flutter_bargraph/blob/master/example/lib/main.dart).*

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
* `indicatorStyle` is the scale indicators style, default BOTH, left and right visible.
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


### Example

| ![Image](https://github.com/rickypid/flutter_bargraph/blob/master/doc/.media/example_space_around.png?raw=true) | ![Image](https://github.com/rickypid/flutter_bargraph/blob/master/doc/.media/example_space_around_horizontal.png?raw=true) | ![Image](https://github.com/rickypid/flutter_bargraph/blob/master/doc/.media/example_space_between.png?raw=true) |
| :------------: | :------------: | :------------: |
| **Vertical space around** | **Horizontal space around** | **Vertical space between** |

## 📚 My other packages

### Flutter

| Package | Verison | Score | Likes | Test | Coverage |
|--|--|--|--|--|--|
| [![](https://img.shields.io/static/v1?label=flutter&message=flutter_expandable_table&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/flutter_expandable_table) | [![Pub Package](https://img.shields.io/pub/v/flutter_expandable_table.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_expandable_table) | [![pub points](https://badges.bar/flutter_expandable_table/pub%20points)](https://pub.dev/packages/flutter_expandable_table/score) | [![likes](https://badges.bar/flutter_expandable_table/likes)](https://pub.dev/packages/flutter_expandable_table/score) |  |  |
| [![](https://img.shields.io/static/v1?label=flutter&message=widget_tree_depth_counter&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/widget_tree_depth_counter) | [![Pub Package](https://img.shields.io/pub/v/widget_tree_depth_counter.svg?style=flat-square)](https://pub.dartlang.org/packages/widget_tree_depth_counter) | [![pub points](https://badges.bar/widget_tree_depth_counter/pub%20points)](https://pub.dev/packages/widget_tree_depth_counter/score) | [![likes](https://badges.bar/widget_tree_depth_counter/likes)](https://pub.dev/packages/widget_tree_depth_counter/score) |  |  |
| [![](https://img.shields.io/static/v1?label=flutter&message=flutter_scroll_shadow&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/flutter_scroll_shadow) | [![Pub Package](https://img.shields.io/pub/v/flutter_scroll_shadow.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_scroll_shadow) | [![pub points](https://badges.bar/flutter_scroll_shadow/pub%20points)](https://pub.dev/packages/flutter_scroll_shadow/score) | [![likes](https://badges.bar/flutter_scroll_shadow/likes)](https://pub.dev/packages/flutter_scroll_shadow/score) |  |  |
| [![](https://img.shields.io/static/v1?label=flutter&message=flutter_bargraph&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/flutter_bargraph) | [![Pub Package](https://img.shields.io/pub/v/flutter_bargraph.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_bargraph) | [![pub points](https://badges.bar/flutter_bargraph/pub%20points)](https://pub.dev/packages/flutter_bargraph/score) | [![likes](https://badges.bar/flutter_bargraph/likes)](https://pub.dev/packages/flutter_bargraph/score) |  |  |


### Dart

| Package | Verison | Score | Likes | Test | Coverage |
|--|--|--|--|--|--|
| [![](https://img.shields.io/static/v1?label=dart&message=cowsay&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/cowsay) | [![Pub Package](https://img.shields.io/pub/v/cowsay.svg?style=flat-square)](https://pub.dartlang.org/packages/cowsay) | [![pub points](https://badges.bar/cowsay/pub%20points)](https://pub.dev/packages/cowsay/score) | [![likes](https://badges.bar/cowsay/likes)](https://pub.dev/packages/cowsay/score) | [![Test CI](https://github.com/rickypid/cowsay/actions/workflows/test.yml/badge.svg)](https://github.com/rickypid/cowsay/actions/workflows/test.yml) | [![codecov](https://codecov.io/gh/rickypid/cowsay/branch/master/graph/badge.svg?token=Z65KEB9SAX)](https://codecov.io/gh/rickypid/cowsay) |


