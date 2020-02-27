library globalui;

import 'dart:async';
import 'dart:collection';
import 'dart:ui' as ui;
import 'dart:io';

// import 'package:flutter/material.dart' hide Overlay, OverlayEntry;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:globalui/widget/overlay.dart';
import 'package:globalui/core/gui_position.dart';
import 'package:globalui/widget/animation/animation_builder.dart';

part 'gui_future.dart';
part 'gui_manager.dart';

part '../widget/gui_wrap.dart';
part '../widget/gui_container.dart';
part '../widget/gui_theme.dart';

part '../widget/toast/toast_container.dart';
part '../widget/toast/toast_theme.dart';
part '../widget/toast/sdtoast.dart';

part '../widget/modal/modal_container.dart';

// import 'gui_manager.dart';
// import 'gui_position.dart';
// import 'package:oktoast/oktoast.dart';

// import 'position.dart';
// import 'toast_manager.dart';

// part 'toast_future.dart';

LinkedHashMap<_SDToastState, BuildContext> _contextMap = LinkedHashMap();
const _defaultDuration = Duration(
  milliseconds: 2300,
);

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
  final theme = _ToastTheme.of(context);
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
  final theme = _ToastTheme.of(context);

  position ??= theme.position;
  handleTouch ??= theme.handleTouch;
  animationBuilder ??= theme.animationBuilder;
  animationDuration ??=
      theme.animationDuration ?? const Duration(milliseconds: 250);
  animationCurve ??= theme.animationCurve ?? Curves.easeIn;
  duration ??= theme.duration ?? _defaultDuration;

  final movingOnWindowChange = theme?.movingOnWindowChange ?? false;

  final direction = textDirection ?? theme.textDirection ?? TextDirection.ltr;

  GlobalKey<__GuiToastContainerState> key = GlobalKey();

  widget = Align(
    child: widget,
    alignment: position.align,
  );

  entry = OverlayEntry(builder: (ctx) {
    return IgnorePointer(
      ignoring: !handleTouch,
      child: Directionality(
        textDirection: direction,
        child: _GuiToastContainer(
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

/// use the method to dismiss all toast.
void dismissAll({bool showAnim = false}) {
  GuiManager().dismissAll(showAnim: showAnim);
}
