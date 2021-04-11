library flutter_bargraph;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BarGraphOrientation{
  VERTICAL_FROM_TOP,
  VERTICAL_FROM_BOTTOM,
  HORIZONTAL_FROM_LEFT,
  HORIZONTAL_FROM_RIGHT,
}
enum BarGraphIndicatorStyle{
  BOTH,
  ONLY_LEFT_OR_TOP,
  ONLY_RIGHT_OR_BOTTOM,
  NOTHING
}
enum BarGraphIndicatorSpacing{
  SPACE_AROUND,
  SPACE_BETWEEN,
}
class BarGraph extends StatefulWidget {
  final Color backgroundColor;
  final Color barColor;
  final Color indicatorColor;
  final TextStyle textStyle;
  final Alignment textAlign;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final int fractionDigits;
  final int animationDuration;
  final int textFlex;
  final BarGraphOrientation orientation;
  final BarGraphIndicatorStyle indicatorStyle;
  final BarGraphIndicatorSpacing indicatorSpacing;
  /// Creates an [BarGraph]
  /// Material design's
  BarGraph(
      {Key key,
        /// backgroundColor
        /// Select a color
        this.backgroundColor,
        this.barColor,
        this.indicatorColor,
        this.textStyle,
        this.textAlign= Alignment.center,
        this.fractionDigits = 2,
        this.value = 15,
        this.divisions = 10,
        this.min = 0,
        this.max = 100,
        this.animationDuration = 200,
        this.orientation = BarGraphOrientation.VERTICAL_FROM_BOTTOM,
        this.textFlex = 20,
        this.indicatorStyle = BarGraphIndicatorStyle.BOTH,
        this.indicatorSpacing = BarGraphIndicatorSpacing.SPACE_AROUND
      }):
        assert(value >= min, 'The value is less than the specified minimum value'),
        assert(value <= max, 'The value is greater than the specified maximum value'),
        assert(divisions > 0, 'Divisions must be greater than 0'),
        assert(textFlex > 0 && textFlex < 100),
        super(key: key);
  @override
  _BarGraphState createState() => _BarGraphState();
}
enum _SideEnum{
  LEFT,
  RIGHT
}
class _BarGraphState extends State<BarGraph> with TickerProviderStateMixin {
  Animation<double> _animation;
  Tween<double> _tween;
  AnimationController _animationController;
  double _valueImg;
  _BarGraphState();
  @override
  void initState() {
    super.initState();
    _valueImg = widget.value;
    _animationController = AnimationController(duration: Duration(milliseconds: widget.animationDuration), vsync: this);
    _tween = Tween(begin: widget.min, end: widget.value);
    _animation = _tween.animate(_animationController)..addListener(() {
      setState((){});
    });
    _animationController.forward();
  }
  void _updateValue(){
    if(_valueImg != widget.value){
      _tween.begin = _animation.value;
      _animationController.reset();
      _tween.end = widget.value;
      _animationController.forward();
      _valueImg = widget.value;
    }
  }
  double _actualProgress() {
    double progress = (_animation.value - widget.min) / (widget.max - widget.min);
    double offset = 0;
    if(widget.indicatorSpacing==BarGraphIndicatorSpacing.SPACE_AROUND)
      offset = ((1 / (widget.divisions + 1)) / 2);
    return offset + (progress * (1 - (offset * 2)));
  }
  Widget _getVerticalHorizontalPrincipalWidget(List<Widget> children){
    if(widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_LEFT || widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_RIGHT)
      return Column(
        children: children,
      );
    else
      return Row(
        children: children,
      );
  }
  Widget _getVerticalHorizontalSubWidget(List<Widget> children){
    if(widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_LEFT || widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_RIGHT)
      return Row(
        children: children,
        mainAxisAlignment: (widget.indicatorSpacing==BarGraphIndicatorSpacing.SPACE_AROUND)?MainAxisAlignment.spaceAround:MainAxisAlignment.spaceBetween,
      );
    else
      return Column(
        children: children,
        mainAxisAlignment: (widget.indicatorSpacing==BarGraphIndicatorSpacing.SPACE_AROUND)?MainAxisAlignment.spaceAround:MainAxisAlignment.spaceBetween,
      );
  }
  Widget _getVerticalHorizontalTextWidget(List<Widget> children){
    if(widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_LEFT || widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_RIGHT)
      return Row(
        children: children,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      );
    else
      return Column(
        children: children,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      );
  }
  List<Widget> _getLabels(){
    List<Widget> widgets = List.generate(widget.divisions + 1, (index) {
      Widget text = null;
      if (widget.indicatorSpacing==BarGraphIndicatorSpacing.SPACE_AROUND || (index > 0 && index < widget.divisions))
        text = Text( (widget.min + (index * ((widget.max - widget.min) / widget.divisions))).toStringAsFixed(widget.fractionDigits), style: widget.textStyle);

      return Expanded(
          flex: (widget.indicatorSpacing==BarGraphIndicatorSpacing.SPACE_AROUND || (index > 0 && index < widget.divisions))?2:1,
          child: Container(
              alignment: widget.textAlign,
              child: text
          )
      );
    });
    if(widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_RIGHT || widget.orientation == BarGraphOrientation.VERTICAL_FROM_BOTTOM)
      widgets = widgets.reversed.toList();
    return widgets;
  }
  Widget _getIndicators(_SideEnum side){
    return Expanded(
        flex: (widget.indicatorStyle==BarGraphIndicatorStyle.BOTH)?((100 - widget.textFlex) ~/ 2):(100 - widget.textFlex),
        child: _getVerticalHorizontalSubWidget(_getBar())
    );
  }
  List<Widget> _getBar(){
    List<Widget> widgets = List.generate(widget.divisions + 1, (index) {
      return Container(
        color: (widget.indicatorColor!=null?widget.indicatorColor:Theme.of(context).buttonColor),
        width: (widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_LEFT || widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_RIGHT)?3:null,
        height: (widget.orientation == BarGraphOrientation.VERTICAL_FROM_TOP || widget.orientation == BarGraphOrientation.VERTICAL_FROM_BOTTOM)?3:null,
      );
    });
    if(widget.orientation == BarGraphOrientation.HORIZONTAL_FROM_RIGHT || widget.orientation == BarGraphOrientation.VERTICAL_FROM_BOTTOM)
      widgets = widgets.reversed.toList();
    return widgets;
  }
  Widget _getLabelAndBar(){
    List<Widget> children = [];
    if(widget.indicatorStyle==BarGraphIndicatorStyle.BOTH || widget.indicatorStyle==BarGraphIndicatorStyle.ONLY_LEFT_OR_TOP)
      children.add(_getIndicators(_SideEnum.LEFT));

    children.add(Expanded(
      flex: widget.textFlex,
      child: _getVerticalHorizontalTextWidget(_getLabels()),
    ));
    if(widget.indicatorStyle==BarGraphIndicatorStyle.BOTH || widget.indicatorStyle==BarGraphIndicatorStyle.ONLY_RIGHT_OR_BOTTOM)
      children.add(_getIndicators(_SideEnum.RIGHT));
    return _getVerticalHorizontalPrincipalWidget(children);
  }
  int _getProgressQuarterTurns(){
    if(widget.orientation == BarGraphOrientation.VERTICAL_FROM_TOP || widget.orientation == BarGraphOrientation.VERTICAL_FROM_BOTTOM)
      return 1;
    else
      return 0;
  }
  Alignment _getProgressAlignment(){
    switch(widget.orientation){
      case BarGraphOrientation.HORIZONTAL_FROM_LEFT:
        return Alignment.topLeft;
      case BarGraphOrientation.HORIZONTAL_FROM_RIGHT:
        return Alignment.topRight;
      case BarGraphOrientation.VERTICAL_FROM_TOP:
        return Alignment.topLeft;
      case BarGraphOrientation.VERTICAL_FROM_BOTTOM:
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
        color: (widget.backgroundColor!=null?widget.backgroundColor:Theme.of(context).scaffoldBackgroundColor),
      ),
      Container(
        alignment: _getProgressAlignment(),
        child: RotatedBox(
          quarterTurns: _getProgressQuarterTurns(),
          child: FractionallySizedBox(
            widthFactor: _actualProgress(),
            heightFactor: 1,
            child: Container(
              color: (widget.barColor!=null?widget.barColor:Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
      Container(
          child: _getLabelAndBar()
      ),
    ]);
  }
}

