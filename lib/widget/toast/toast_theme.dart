part of '../../core/gui_core.dart';

class ToastTheme {
  final TextStyle textStyle;

  final Color backgroundColor;
  
  final double radius;

  final GuiPosition position;

  final bool dismissOtherOnShow;

  final bool movingOnWindowChange;

  final TextDirection textDirection;

  final EdgeInsets textPadding;

  final TextAlign textAlign;

  final bool handleTouch;

  final GuiAnimationBuilder animationBuilder;

  final Duration animationDuration;

  final Curve animationCurve;

  final Duration duration;

  ToastTheme(
      {this.textStyle,
      this.backgroundColor = const Color(0xDD000000),
      this.radius = 10.0,
      this.position = GuiPosition.center,
      this.dismissOtherOnShow = false,
      this.movingOnWindowChange = true,
      this.textDirection = TextDirection.ltr,
      this.textPadding = const EdgeInsets.symmetric(
        horizontal: 28.0,
        vertical: 15.0,
      ),
      this.textAlign = TextAlign.center,
      this.handleTouch = false,
      this.animationBuilder,
      this.animationDuration,
      this.animationCurve,
      this.duration = const Duration(milliseconds: 2300)});

  //  static const 
}
