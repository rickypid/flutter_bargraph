library flutter_bargraph;

// Flutter imports:
import 'package:flutter/material.dart';

/// [BarGraphOrientation] Enum
enum BarGraphOrientation {
  /// Bar orientation Vertical top to bottom
  verticalFromTop,

  /// Bar orientation Vertical bottom to top
  verticalFromBottom,

  /// Bar orientation Horizontal left to right
  horizontalFromLeft,

  /// Bar orientation Horizontal right to left
  horizzontalFromRight,
}

/// [BarGraphIndicatorStyle] Enum
enum BarGraphIndicatorStyle {
  /// View all indicator
  both,

  /// View only left/Top indicator
  onlyLeftOrTop,

  /// View only Right/Bottom indicator
  onlyRightOrBottom,

  /// Hidden all indicator
  nothing
}

/// [BarGraphIndicatorSpacing] Enum
enum BarGraphIndicatorSpacing {
  /// Is indicator spacing type
  spaceAround,

  /// Is indicator spacing type
  spaceBetween,
}

class BarGraph extends StatefulWidget {
  /// Is [backgroundColor] of BarGraph
  ///
  /// Default Theme.of(context).scaffoldBackgroundColor
  final Color? backgroundColor;

  /// [barColor] is a color of BarGraph bar
  ///
  /// DefaultTheme.of(context).primaryColor
  final Color barColor;

  /// [indicatorsColor] is a color of BarGraph line indicator
  ///
  /// Default: Theme.of(context).buttonColor
  final Color indicatorsColor;

  /// [textStyle] is a TextStyle of BarGraph text label indicator
  ///
  /// Default: Text Widget default TextStyle
  final TextStyle? textStyle;

  /// [textAlign] is a Alignment of BarGraph text label indicator
  ///
  /// Default: Alignment.center
  final Alignment textAlign;

  /// [value] is actual value of BarGraph bar
  ///
  /// Default: 15
  final double value;

  /// [min] is min value of BarGraph scale
  ///
  /// Default: 0
  final double min;

  /// [max] is max value of BarGraph scale
  ///
  ///Default: 100
  final double max;

  /// [divisions] is count of BarGraph indicators
  ///
  /// Default: 10
  final int divisions;

  /// [fractionDigits] is number of digits of BarGraph text label indicator
  ///
  /// Default: 2
  final int fractionDigits;

  /// [animationDuration] is a millisecond of animation duration on changed value of BarGraph
  ///
  /// Default: 200 milliseconds
  final int animationDuration;

  /// [textFlex] is the percentage of portion used for text, remaining space is used for indicators.
  ///
  ///Default: 20%
  final int textFlex;

  /// [orientation] is a orientation of BarGraph
  ///
  /// Default: BarGraphOrientation.VERTICAL_FROM_BOTTOM
  ///
  /// Possible orientation:
  ///   * BarGraphOrientation.VERTICAL_FROM_TOP
  ///   * BarGraphOrientation.VERTICAL_FROM_BOTTOM
  ///   * BarGraphOrientation.HORIZONTAL_FROM_LEFT
  ///   * BarGraphOrientation.HORIZONTAL_FROM_RIGHT
  final BarGraphOrientation orientation;

  /// [indicatorStyle] is the scale indicators style
  ///
  /// Default: BarGraphIndicatorStyle.BOTH, left and right visible.
  ///
  /// Possible orientation:
  ///   * BarGraphIndicatorStyle.BOTH
  ///   * BarGraphIndicatorStyle.ONLY_LEFT_OR_TOP
  ///   * BarGraphIndicatorStyle.ONLY_RIGHT_OR_BOTTOM
  ///   * BarGraphIndicatorStyle.NOTHING
  final BarGraphIndicatorStyle indicatorStyle;

  /// [indicatorSpacing] is the scale indicators spacing
  ///
  /// Default: BarGraphIndicatorSpacing.SPACE_AROUND
  ///
  /// Possible orientation:
  ///   * BarGraphIndicatorSpacing.SPACE_AROUND
  ///   * BarGraphIndicatorSpacing.SPACE_BETWEEN
  final BarGraphIndicatorSpacing indicatorSpacing;

  /// Creates an [BarGraph]
  /// Material design's
  const BarGraph(
      {Key? key,
      this.backgroundColor,
      this.barColor = Colors.blue,
      this.indicatorsColor = Colors.grey,
      this.textStyle,
      this.textAlign = Alignment.center,
      this.fractionDigits = 2,
      this.value = 15,
      this.divisions = 10,
      this.min = 0,
      this.max = 100,
      this.animationDuration = 200,
      this.orientation = BarGraphOrientation.verticalFromBottom,
      this.textFlex = 20,
      this.indicatorStyle = BarGraphIndicatorStyle.both,
      this.indicatorSpacing = BarGraphIndicatorSpacing.spaceAround})
      : assert(
            value >= min, 'The value is less than the specified minimum value'),
        assert(value <= max,
            'The value is greater than the specified maximum value'),
        assert(divisions > 0, 'Divisions must be greater than 0'),
        assert(textFlex > 0 && textFlex < 100),
        super(key: key);

  @override
  State<BarGraph> createState() => _BarGraphState();
}

enum _SideEnum { left, right }

class _BarGraphState extends State<BarGraph> with TickerProviderStateMixin {
  late Animation _animation;
  late Tween<double> _tween;
  late AnimationController _animationController;
  double _valueImg = 0;

  _BarGraphState();

  @override
  void initState() {
    super.initState();
    _valueImg = widget.value;
    _animationController = AnimationController(
        duration: Duration(milliseconds: widget.animationDuration),
        vsync: this);
    _tween = Tween(begin: widget.min, end: widget.value);
    _animation = _tween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  void _updateValue() {
    if (_valueImg != widget.value) {
      _tween.begin = _animation.value;
      _animationController.reset();
      _tween.end = widget.value;
      _animationController.forward();
      _valueImg = widget.value;
    }
  }

  double _actualProgress() {
    double progress =
        (_animation.value - widget.min) / (widget.max - widget.min);
    double offset = 0;
    if (widget.indicatorSpacing == BarGraphIndicatorSpacing.spaceAround) {
      offset = ((1 / (widget.divisions + 1)) / 2);
    }
    return offset + (progress * (1 - (offset * 2)));
  }

  Widget _getVerticalHorizontalPrincipalWidget(List<Widget> children) {
    if (widget.orientation == BarGraphOrientation.horizontalFromLeft ||
        widget.orientation == BarGraphOrientation.horizzontalFromRight) {
      return Column(
        children: children,
      );
    } else {
      return Row(
        children: children,
      );
    }
  }

  Widget _getVerticalHorizontalSubWidget(List<Widget> children) {
    if (widget.orientation == BarGraphOrientation.horizontalFromLeft ||
        widget.orientation == BarGraphOrientation.horizzontalFromRight) {
      return Row(
        mainAxisAlignment:
            (widget.indicatorSpacing == BarGraphIndicatorSpacing.spaceAround)
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.spaceBetween,
        children: children,
      );
    } else {
      return Column(
        mainAxisAlignment:
            (widget.indicatorSpacing == BarGraphIndicatorSpacing.spaceAround)
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.spaceBetween,
        children: children,
      );
    }
  }

  Widget _getVerticalHorizontalTextWidget(List<Widget> children) {
    if (widget.orientation == BarGraphOrientation.horizontalFromLeft ||
        widget.orientation == BarGraphOrientation.horizzontalFromRight) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      );
    }
  }

  List<Widget> _getLabels() {
    List<Widget> widgets = List.generate(widget.divisions + 1, (index) {
      Widget text;
      if (widget.indicatorSpacing == BarGraphIndicatorSpacing.spaceAround ||
          (index > 0 && index < widget.divisions)) {
        text = Text(
            (widget.min +
                    (index * ((widget.max - widget.min) / widget.divisions)))
                .toStringAsFixed(widget.fractionDigits),
            style: widget.textStyle);
      } else {
        text = const Text('');
      }

      return Expanded(
          flex: (widget.indicatorSpacing ==
                      BarGraphIndicatorSpacing.spaceAround ||
                  (index > 0 && index < widget.divisions))
              ? 2
              : 1,
          child: Container(alignment: widget.textAlign, child: text));
    });
    if (widget.orientation == BarGraphOrientation.horizzontalFromRight ||
        widget.orientation == BarGraphOrientation.verticalFromBottom) {
      widgets = widgets.reversed.toList();
    }
    return widgets;
  }

  Widget _getIndicators(_SideEnum side) {
    return Expanded(
        flex: (widget.indicatorStyle == BarGraphIndicatorStyle.both)
            ? ((100 - widget.textFlex) ~/ 2)
            : (100 - widget.textFlex),
        child: _getVerticalHorizontalSubWidget(_getBar()));
  }

  List<Widget> _getBar() {
    List<Widget> widgets = List.generate(widget.divisions + 1, (index) {
      return Container(
        color: widget.indicatorsColor,
        width: (widget.orientation ==
                    BarGraphOrientation.horizontalFromLeft ||
                widget.orientation == BarGraphOrientation.horizzontalFromRight)
            ? 3
            : null,
        height: (widget.orientation == BarGraphOrientation.verticalFromTop ||
                widget.orientation == BarGraphOrientation.verticalFromBottom)
            ? 3
            : null,
      );
    });
    if (widget.orientation == BarGraphOrientation.horizzontalFromRight ||
        widget.orientation == BarGraphOrientation.verticalFromBottom) {
      widgets = widgets.reversed.toList();
    }
    return widgets;
  }

  Widget _getLabelAndBar() {
    List<Widget> children = [];
    if (widget.indicatorStyle == BarGraphIndicatorStyle.both ||
        widget.indicatorStyle == BarGraphIndicatorStyle.onlyLeftOrTop) {
      children.add(_getIndicators(_SideEnum.left));
    }

    children.add(Expanded(
      flex: widget.textFlex,
      child: _getVerticalHorizontalTextWidget(_getLabels()),
    ));
    if (widget.indicatorStyle == BarGraphIndicatorStyle.both ||
        widget.indicatorStyle == BarGraphIndicatorStyle.onlyRightOrBottom) {
      children.add(_getIndicators(_SideEnum.right));
    }
    return _getVerticalHorizontalPrincipalWidget(children);
  }

  int _getProgressQuarterTurns() {
    if (widget.orientation == BarGraphOrientation.verticalFromTop ||
        widget.orientation == BarGraphOrientation.verticalFromBottom) {
      return 1;
    } else {
      return 0;
    }
  }

  Alignment _getProgressAlignment() {
    switch (widget.orientation) {
      case BarGraphOrientation.horizontalFromLeft:
        return Alignment.topLeft;
      case BarGraphOrientation.horizzontalFromRight:
        return Alignment.topRight;
      case BarGraphOrientation.verticalFromTop:
        return Alignment.topLeft;
      case BarGraphOrientation.verticalFromBottom:
        return Alignment.bottomLeft;
      default:
        return Alignment.topLeft;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _updateValue();
    return Stack(children: [
      Container(
        color: widget.backgroundColor,
      ),
      Container(
        alignment: _getProgressAlignment(),
        child: RotatedBox(
          quarterTurns: _getProgressQuarterTurns(),
          child: FractionallySizedBox(
            widthFactor: _actualProgress(),
            heightFactor: 1,
            child: Container(
              color: widget.barColor,
            ),
          ),
        ),
      ),
      Container(child: _getLabelAndBar()),
    ]);
  }
}
