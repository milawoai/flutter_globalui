part of '../../core/gui_core.dart';

/// show toast with [msg],
GuiFuture showToast(
  String msg, {
  BuildContext context,
  Duration duration,
  GuiPosition position,
  TextStyle textStyle,
  EdgeInsetsGeometry textPadding,
  Color backgroundColor,
  double radius,
  VoidCallback onDismiss,
  TextDirection textDirection,
  bool dismissOtherToast,
  TextAlign textAlign,
  GuiAnimationBuilder animationBuilder,
  Duration animationDuration,
  Curve animationCurve,
}) {
  context ??= _contextMap.values.first;
  final theme = _GuiTheme.of(context).toastTheme;
  textStyle ??= theme.textStyle ?? TextStyle(fontSize: 15.0);
  textAlign ??= theme.textAlign;
  textPadding ??= theme.textPadding;
  position ??= theme.position;
  backgroundColor ??= theme.backgroundColor;
  radius ??= theme.radius;
  textDirection ??= theme.textDirection ?? TextDirection.ltr;

  Widget widget = Container(
    margin: const EdgeInsets.all(50.0),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    padding: textPadding,
    child: ClipRect(
      child: Text(
        msg,
        style: textStyle,
        textAlign: textAlign,
      ),
    ),
  );

  return showToastWidget(
    widget,
    animationBuilder: animationBuilder,
    context: context,
    duration: duration,
    onDismiss: onDismiss,
    position: position,
    dismissOtherToast: dismissOtherToast,
    textDirection: textDirection,
    animationCurve: animationCurve,
  );
}

/// show [widget] with oktoast
GuiFuture showToastWidget(
  Widget widget, {
  BuildContext context,
  Duration duration,
  GuiPosition position,
  VoidCallback onDismiss,
  bool dismissOtherToast,
  TextDirection textDirection,
  bool handleTouch,
  GuiAnimationBuilder animationBuilder,
  Duration animationDuration,
  Curve animationCurve,
}) {
  context ??= _contextMap.values.first;
  OverlayEntry entry;
  GuiFuture future;
  final theme = _GuiTheme.of(context).toastTheme;
  position ??= theme.position;
  handleTouch ??= theme.handleTouch;
  animationBuilder ??= theme.animationBuilder;
  animationDuration ??=
      theme.animationDuration ?? const Duration(milliseconds: 250);
  animationCurve ??= theme.animationCurve ?? Curves.easeIn;
  duration ??= theme.duration ?? _defaultDuration;

  final movingOnWindowChange = theme?.movingOnWindowChange ?? false;

  final direction = textDirection ?? theme.textDirection ?? TextDirection.ltr;

  GlobalKey<__GuiContainerState> key = GlobalKey();

  widget = Align(
    child: widget,
    alignment: position.align,
  );

  entry = OverlayEntry(builder: (ctx) {
    return IgnorePointer(
      ignoring: !handleTouch,
      child: Directionality(
        textDirection: direction,
        child: _GuiContainer(
          duration: duration,
          position: position,
          movingOnWindowChange: movingOnWindowChange,
          key: key,
          child: widget,
          animationBuilder: animationBuilder,
          animationDuration: animationDuration,
          animationCurve: animationCurve,
        ),
      ),
    );
  });

  dismissOtherToast ??= theme.dismissOtherOnShow ?? false;

  if (dismissOtherToast == true) {
    GuiManager().dismissAll();
  }

  future = GuiFuture._(entry, onDismiss, key, animationDuration);

  Future.delayed(duration, () {
    future.dismiss();
  });

  Overlay.of(context).insert(entry);
  GuiManager().addFuture(future);

  return future;
}