part of '../../core/gui_core.dart';

class SDToast extends StatefulWidget {
   /// Usually should be [MaterialApp] or [CupertinoApp].
  final Widget child;

  /// Default textStyle of [showToast].
  final TextStyle textStyle;

  /// Default backgroundColor of [showToast].
  final Color backgroundColor;

  /// Default radius of [showToast].
  final double radius;

  /// Default align and padding of [showToast].
  final GuiPosition position;

  /// Default textDirection of [showToast].
  final TextDirection textDirection;

  /// Default dismissOtherOnShow of [showToast].
  final bool dismissOtherOnShow;

  /// When the screen size changes due to the soft keyboard / rotation screen, toast will reposition.
  final bool movingOnWindowChange;

  /// TDefault textAlign of [textPadding].
  final EdgeInsets textPadding;

  /// Default textAlign of [showToast].
  final TextAlign textAlign;

  /// Whether toast can respond to click events.
  final bool handleTouth;

  final Duration duration;

  /// The animation builder of show/hide toast.
  final GuiAnimationBuilder animationBuilder;

  /// The animation duration of show/hide toast.
  final Duration animationDuration;

  /// The animation curve of show/hide toast.
  final Curve animationCurve;

  const SDToast({
    Key key,
    @required this.child,
    this.textStyle,
    this.backgroundColor = const Color(0xDD000000),
    this.radius = 10.0,
    this.position = GuiPosition.center,
    this.textDirection = TextDirection.ltr,
    this.dismissOtherOnShow = false,
    this.movingOnWindowChange = true,
    this.textPadding,
    this.textAlign,
    this.handleTouth = false,
    this.duration,
    this.animationBuilder,
    this.animationDuration = const Duration(milliseconds: 250),
    this.animationCurve}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SDToastState();
}

class _SDToastState extends State<SDToast> {

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
    var overlay = Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (ctx) {
            _contextMap[this] = ctx;
            return widget.child;
          },
        ),
      ],
    );
    TextDirection direction = widget.textDirection ?? TextDirection.ltr;

    Widget w = Directionality(
      child: overlay,
      textDirection: direction,
    );

    var typography = Typography(platform: TargetPlatform.android);
    final TextTheme defaultTextTheme = typography.white;
    TextStyle textStyle = widget.textStyle ??
        defaultTextTheme.body1.copyWith(
          fontSize: 35.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        );

    TextAlign textAlign = widget.textAlign ?? TextAlign.center;
    EdgeInsets textPadding = widget.textPadding ??
        const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        );

    return _ToastTheme(
      child: w,
      backgroundColor: widget.backgroundColor,
      radius: widget.radius,
      textStyle: textStyle,
      position: widget.position,
      dismissOtherOnShow: widget.dismissOtherOnShow,
      movingOnWindowChange: widget.movingOnWindowChange,
      textDirection: direction,
      textAlign: textAlign,
      textPadding: textPadding,
      handleTouch: widget.handleTouth,
      animationBuilder: widget.animationBuilder,
      animationDuration: widget.animationDuration,
      animationCurve: widget.animationCurve,
      duration: widget.duration,
    );

  }
}