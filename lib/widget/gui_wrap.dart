part of '../core/gui_core.dart';

class GuiWrapper extends StatefulWidget {
    /// Usually should be [MaterialApp] or [CupertinoApp].
    final Widget child;

    /// Default titleStyle of [showModal].
    final TextStyle modalTitleStyle;

     /// TDefault textAlign of [textPadding].
    final EdgeInsets modalTitlePadding;

    /// Default textStyle of [showModal].
    final TextStyle modalTextStyle;

     /// TDefault textAlign of [textPadding].
    final EdgeInsets modalTextPadding;

    /// Default backgroundColor of [showModal].
    final Color modalBackgroundColor;

    /// Default radius of [showModal].
    final double modalRadius;

    /// Default align and padding of [showModal].
    final GuiPosition modalPosition;

    /// Default dismissOtherOnShow of [showModal].
    final bool modalDismissOtherOnShow;

    /// When the screen size changes due to the soft keyboard / rotation screen, toast will reposition.
    final bool modalMovingOnWindowChange;

    /// The animation builder of show/hide toast.
    final GuiAnimationBuilder modalAnimationBuilder;

    /// The animation duration of show/hide toast.
    final Duration modalAnimationDuration;

    /// The animation curve of show/hide toast.
    final Curve modalAnimationCurve;

  const GuiWrapper({Key key, this.modalTitleStyle, this.modalTitlePadding, this.modalTextStyle, this.modalTextPadding, this.modalBackgroundColor, this.modalRadius, this.modalPosition, this.modalDismissOtherOnShow, this.modalMovingOnWindowChange, this.modalAnimationBuilder, this.modalAnimationDuration, this.modalAnimationCurve, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuiWrapperState();
}

class _GuiWrapperState extends State<GuiWrapper> {

   @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _contextMap.remove(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var overlay = Overlay(
    //   initialEntries: [
    //     OverlayEntry(
    //       builder: (ctx) {
    //         _contextMap[this] = ctx;
    //         return widget.child;
    //       },
    //     ),
    //   ],
    // );

    // var typography = Typography(platform: Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android);
    // final TextTheme defaultTextTheme = typography.white;
    // TextStyle textStyle = widget.textStyle ??
    //     defaultTextTheme.body1.copyWith(
    //       fontSize: 15.0,
    //       fontWeight: FontWeight.normal,
    //       color: Colors.white,
    //     );

    return null;
  }

}