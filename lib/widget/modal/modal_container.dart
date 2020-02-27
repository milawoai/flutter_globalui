part of '../../core/gui_core.dart';

class _GuiModalContainer extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final bool movingOnWindowChange;
  final GuiPosition position;

  final GuiAnimationBuilder animationBuilder;
  final Duration animationDuration;
  final Curve animationCurve;

  const _GuiModalContainer(
      {Key key,
      this.duration,
      this.movingOnWindowChange,
      this.position,
      this.animationBuilder,
      this.animationDuration,
      this.animationCurve,
      this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => __GuiModalContainerState();
}

class __GuiModalContainerState extends State<_GuiToastContainer>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  bool get movingOnWindowChange => widget.movingOnWindowChange;
  double get offset => widget.position.offset;
  Duration get animationDuration => widget.animationDuration;
  AnimationController _animationController;
  //      Duration get animationDuration => widget.animationDuration;
  // @override

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
      reverseDuration: animationDuration,
    );

    Future.delayed(const Duration(milliseconds: 30), () {
      _animateTo(1.0);
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
     Widget w;
    if (widget.animationBuilder != null) {
      w = _buildAnimationWidget();
    } else {
      w = AnimatedBuilder(
        child: widget.child,
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Opacity(
            child: child,
            opacity: _animationController.value,
          );
        },
      );
    }

    if (movingOnWindowChange != true) {
      return w;
    }

    var mediaQueryData = MediaQueryData.fromWindow(ui.window);
    Widget container = w;

    var edgeInsets = EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom);
    if (offset > 0) {
      var padding = EdgeInsets.only(top: offset) + edgeInsets;

      container = AnimatedPadding(
        duration: animationDuration,
        padding: padding,
        child: container,
      );
    } else if (offset < 0) {
      container = AnimatedPadding(
        duration: animationDuration,
        padding: EdgeInsets.only(bottom: offset.abs()) + edgeInsets,
        child: container,
      );
    } else {
      container = AnimatedPadding(
        duration: animationDuration,
        padding: edgeInsets,
        child: container,
      );
    }
    return container;
  }

  Widget _buildAnimationWidget() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        return widget.animationBuilder(
          context,
          widget.child,
          _animationController,
          _animationController?.value ?? 0,
        );
      },
    );
  }

  void _animateTo(double value) {
    if (!mounted) {
      return;
    }
    if (value == 0) {
      _animationController?.animateTo(
        value,
        duration: animationDuration,
        curve: widget.animationCurve,
      );
    } else {
      _animationController?.animateBack(
        value,
        duration: animationDuration,
        curve: widget.animationCurve,
      );
    }
  }
}
