import 'package:flutter/widgets.dart';

class GuiPosition {
  final AlignmentGeometry align;
  final double offset;

  const GuiPosition({this.align = Alignment.center, this.offset = 0.0});

  static const center =
      const GuiPosition(align: Alignment.center, offset: 0.0);

  static const bottom =
      const GuiPosition(align: Alignment.bottomCenter, offset: -30.0);

  static const top =
      const GuiPosition(align: Alignment.topCenter, offset: 75.0);

  @override
  String toString() {
    return "ToastPosition [ align = $align, offset = $offset ] ";
  }
}
