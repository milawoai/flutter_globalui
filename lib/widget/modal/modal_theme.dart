part of '../../core/gui_core.dart';

class ModalTheme {
  final TextStyle titleStyle;
  final TextStyle msgStyle;
  final TextStyle btnStyle;
  final Color backgroundColor;
  final double radius;
  final double gapTitleToTop;
  final double gapMsgToTitle;
  final double gapButtonAreaToMsg;
  final double modalWidth;
  final double buttonAreaHeight;

  final bool useBtnTopLine;
  final Color btnTopLineColor;
  final double topLineHeight;

  final bool useBtnMiddleLine;
  final Color btnMiddleLineColor;
  final double middleLineHeight;


  final GuiAnimationBuilder animationBuilder;
  final Duration animationDuration;
  final Curve animationCurve;

  ModalTheme({
    this.titleStyle = const TextStyle(color: Colors.black, fontSize: 15.0),
    this.msgStyle = const TextStyle(color: Colors.black, fontSize: 12.0),
    this.btnStyle,
    this.backgroundColor = Colors.white,
    this.radius = 5.0,
    this.gapTitleToTop = 10.0,
    this.gapMsgToTitle = 10.0,
    this.modalWidth = 200.0,
    this.gapButtonAreaToMsg = 10.0,
    this.buttonAreaHeight = 30.0,
    this.animationBuilder,
    this.animationDuration,
    this.animationCurve, 
    this.useBtnTopLine = true, 
    this.btnTopLineColor = const Color(0xDBDBDBDB), 
    this.topLineHeight = 1.0, 
    this.useBtnMiddleLine = false, 
    this.btnMiddleLineColor = const Color(0xDBDBDBDB), 
    this.middleLineHeight
  });
}