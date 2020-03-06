library globalui;

import 'dart:async';
import 'dart:collection';
import 'dart:ui' as ui;
//import 'dart:io' show Platform;

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

part '../widget/toast/toast_theme.dart';
part '../widget/toast/toast_func.dart';

part '../widget/modal/modal_theme.dart';
part '../widget/modal/modal_func.dart';

LinkedHashMap<_GuiWrapperState, BuildContext> _contextMap = LinkedHashMap();
const _defaultDuration = Duration(
  milliseconds: 2300,
);

/// use the method to dismiss all toast.
void dismissAll({bool showAnim = false}) {
  GuiManager().dismissAll(showAnim: showAnim);
}
