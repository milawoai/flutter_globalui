part of '../../core/gui_core.dart';

class ModalButtonInfos {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final bool isCloseModal;

  ModalButtonInfos(this.text,
      {this.textStyle = const TextStyle(color: Colors.black, fontSize: 15.0),
      this.backgroundColor = Colors.white,
      this.onPressed,
      this.isCloseModal = true});
}

// show modal with two Button,
GuiFuture showCancelConfirmModal(
    {String title,
    TextStyle titleStyle,
    String msg,
    TextStyle msgStyle,
    Color backgroundColor,
    String cancelText = "取消",
    TextStyle cancelTextStyle,
    Color cancelBackgroundColor,
    VoidCallback onCancelPressed,
    bool isCancelCloseModal,
    String confirmText = "确定",
    TextStyle confirmTextStyle,
    Color confirmBackgroundColor,
    VoidCallback onConfirmPressed,
    bool isConfirmCloseModal,
    double radius,
    double gapTitleToTop,
    double gapMsgToTitle,
    double gapButtonAreaToMsg,
    double modalWidth,
    double buttonAreaHeight,
    bool useBtnTopLine,
    Color btnTopLineColor,
    double topLineHeight,
    bool useBtnMiddleLine,
    Color btnMiddleLineColor,
    double middleLineHeight,
    BuildContext context,
    GuiPosition position,
    VoidCallback onDismiss,
    bool dismissOtherToast,
    GuiAnimationBuilder animationBuilder,
    Duration animationDuration,
    Curve animationCurve}) {


  List<ModalButtonInfos> buttonInfos = [
    ModalButtonInfos(cancelText,
        textStyle: cancelTextStyle ?? const TextStyle(color: Colors.black, fontSize: 15.0),
        backgroundColor: cancelBackgroundColor ?? Colors.white,
        onPressed: onCancelPressed,
        isCloseModal: isCancelCloseModal ?? true),
    ModalButtonInfos(confirmText,
        textStyle: confirmTextStyle ?? const TextStyle(color: Colors.white, fontSize: 15.0),
        backgroundColor: confirmBackgroundColor ?? Colors.blue,
        onPressed: onConfirmPressed,
        isCloseModal: isConfirmCloseModal ?? true)
  ];
  return showModal(
      title: title,
      titleStyle: titleStyle,
      msg: msg,
      msgStyle: msgStyle,
      backgroundColor: backgroundColor,
      buttonInfos: buttonInfos,
      radius: radius,
      gapTitleToTop: gapTitleToTop,
      gapMsgToTitle: gapMsgToTitle,
      gapButtonAreaToMsg: gapButtonAreaToMsg,
      modalWidth: modalWidth,
      buttonAreaHeight: buttonAreaHeight,
      useBtnTopLine: useBtnTopLine,
      btnTopLineColor: btnTopLineColor,
      topLineHeight: topLineHeight,
      useBtnMiddleLine: useBtnMiddleLine,
      btnMiddleLineColor: btnMiddleLineColor,
      middleLineHeight: middleLineHeight,
      context: context,
      position: position,
      onDismiss: onDismiss,
      dismissOtherToast: dismissOtherToast,
      animationBuilder: animationBuilder,
      animationDuration: animationDuration,
      animationCurve: animationCurve);
}

// show modal with One Button,
GuiFuture showCancelModal(
    {String title,
    TextStyle titleStyle,
    String msg,
    TextStyle msgStyle,
    Color backgroundColor,
    String cancelText = "取消",
    TextStyle cancelTextStyle,
    Color cancelBackgroundColor,
    VoidCallback onCancelPressed,
    bool isCancelCloseModal,
    double radius,
    double gapTitleToTop,
    double gapMsgToTitle,
    double gapButtonAreaToMsg,
    double modalWidth,
    double buttonAreaHeight,
    bool useBtnTopLine,
    Color btnTopLineColor,
    double topLineHeight,
    bool useBtnMiddleLine,
    Color btnMiddleLineColor,
    double middleLineHeight,
    BuildContext context,
    GuiPosition position,
    VoidCallback onDismiss,
    bool dismissOtherToast,
    GuiAnimationBuilder animationBuilder,
    Duration animationDuration,
    Curve animationCurve}) {
  List<ModalButtonInfos> buttonInfos = [
    ModalButtonInfos(cancelText,
        textStyle: cancelTextStyle ?? const TextStyle(color: Colors.black, fontSize: 15.0),
        backgroundColor: cancelBackgroundColor ?? Colors.white,
        onPressed: onCancelPressed,
        isCloseModal: isCancelCloseModal ?? true)
  ];
  return showModal(
      title: title,
      titleStyle: titleStyle,
      msg: msg,
      msgStyle: msgStyle,
      backgroundColor: backgroundColor,
      buttonInfos: buttonInfos,
      radius: radius,
      gapTitleToTop: gapTitleToTop,
      gapMsgToTitle: gapMsgToTitle,
      gapButtonAreaToMsg: gapButtonAreaToMsg,
      modalWidth: modalWidth,
      buttonAreaHeight: buttonAreaHeight,
      useBtnTopLine: useBtnTopLine,
      btnTopLineColor: btnTopLineColor,
      topLineHeight: topLineHeight,
      useBtnMiddleLine: useBtnMiddleLine,
      btnMiddleLineColor: btnMiddleLineColor,
      middleLineHeight: middleLineHeight,
      context: context,
      position: position,
      onDismiss: onDismiss,
      dismissOtherToast: dismissOtherToast,
      animationBuilder: animationBuilder,
      animationDuration: animationDuration,
      animationCurve: animationCurve);
}

// show toast with [msg],
GuiFuture showModal({
  String title,
  TextStyle titleStyle,
  String msg,
  TextStyle msgStyle,
  Color backgroundColor,
  List<ModalButtonInfos> buttonInfos,
  double radius,
  double gapTitleToTop,
  double gapMsgToTitle,
  double gapButtonAreaToMsg,
  double modalWidth,
  double buttonAreaHeight,
  bool useBtnTopLine,
  Color btnTopLineColor,
  double topLineHeight,
  bool useBtnMiddleLine,
  Color btnMiddleLineColor,
  double middleLineHeight,
  BuildContext context,
  GuiPosition position,
  VoidCallback onDismiss,
  bool dismissOtherToast,
  GuiAnimationBuilder animationBuilder,
  Duration animationDuration,
  Curve animationCurve,
}) {
  context ??= _contextMap.values.first;

  GuiFuture future;

  final theme = _GuiTheme.of(context).modalTheme;
  titleStyle ??=
      theme.titleStyle ?? TextStyle(color: Colors.black, fontSize: 15.0);
  msgStyle ??=
      theme.msgStyle ?? TextStyle(color: Colors.black, fontSize: 12.0);
  backgroundColor ??= theme.backgroundColor;
  radius ??= theme.radius ?? 5.0;
  gapTitleToTop ??= theme.gapTitleToTop ?? 10.0;
  gapMsgToTitle ??= theme.gapMsgToTitle ?? 10.0;
  gapButtonAreaToMsg ??= theme.gapButtonAreaToMsg ?? 10.0;
  modalWidth ??= theme.modalWidth ?? 200.0;
  buttonAreaHeight ??= theme.buttonAreaHeight ?? 30.0;

  useBtnTopLine ??= theme.useBtnTopLine ?? true;
  btnTopLineColor ??= theme.btnTopLineColor ?? Color(0xDBDBDBDB);
  topLineHeight ??= theme.topLineHeight ?? 1.0;

  useBtnMiddleLine ??= theme.useBtnMiddleLine ?? true;
  btnMiddleLineColor ??= theme.btnMiddleLineColor ?? Color(0xDBDBDBDB);
  middleLineHeight ??= theme.middleLineHeight ?? 1.0;

  List<Widget> buttonWidgets = buttonInfos.asMap().keys.map((index) {
    ModalButtonInfos item = buttonInfos[index];
    BorderRadiusGeometry borderRaduis = BorderRadius.zero;
    if (index == 0) {
      borderRaduis =  index == buttonInfos.length - 1 ? 
      BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius)
      ) :
      BorderRadius.only(bottomLeft: Radius.circular(radius));
    } else if (index == buttonInfos.length - 1) {
      BorderRadius.only(bottomRight: Radius.circular(radius));
    }
    return Expanded(
            flex: 1,
            child: GestureDetector(
                  onTap: () {
                    item.onPressed();
                    if (item.isCloseModal) {
                      future?.dismiss();
                    }
                  },
              child: Container(
                decoration: BoxDecoration(
                  color: item.backgroundColor,
                  borderRadius: borderRaduis,
                ),
                child: Center(child: Text(item.text, style: item.textStyle)))
          ));
  }).toList();
  Container _buttonArea =
      Container(height: 45, child: Row(children: buttonWidgets));

  Column _column = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: title == null ? 0 : gapTitleToTop),
        title == null
            ? SizedBox()
            : Text(title == null ? '' : title, style: titleStyle),
        SizedBox(
          height: title != null && msg != null ? gapMsgToTitle : 0,
        ),
        msg != null ? Center(child: Text(msg, style: msgStyle)) : SizedBox(),
        SizedBox(
          height: msg != null ? gapButtonAreaToMsg : 0,
        ),
        useBtnTopLine
            ? SizedBox(
                height: topLineHeight, child: Container(color: btnTopLineColor))
            : SizedBox(),
        _buttonArea
      ]);
  Widget widget = Container(
    width: modalWidth,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 5.0,
                      offset: Offset(0.0, 3.0)
                    ),
      ]
    ),
    child: _column,
  );
  future = showModalWidget(
    widget,
    context: context,
    position: position,
    onDismiss: onDismiss,
    dismissOtherToast: dismissOtherToast,
    animationBuilder: animationBuilder,
    animationDuration: animationDuration,
    animationCurve: animationCurve,
  );
  return future;
}

/// show [widget] with oktoast
GuiFuture showModalWidget(
  Widget widget, {
  BuildContext context,
  GuiPosition position,
  VoidCallback onDismiss,
  bool dismissOtherToast,
  TextDirection textDirection,
  GuiAnimationBuilder animationBuilder,
  Duration animationDuration,
  Curve animationCurve,
}) {
  context ??= _contextMap.values.first;
  OverlayEntry entry;
  GuiFuture future;
  final theme = _GuiTheme.of(context).toastTheme;
  position ??= theme.position;
  animationBuilder ??= theme.animationBuilder;
  animationDuration ??=
      theme.animationDuration ?? const Duration(milliseconds: 250);
  animationCurve ??= theme.animationCurve ?? Curves.easeIn;

  final movingOnWindowChange = theme?.movingOnWindowChange ?? false;

  final direction = textDirection ?? theme.textDirection ?? TextDirection.ltr;

  GlobalKey<__GuiContainerState> key = GlobalKey();

  widget = Align(
    child: widget,
    alignment: position.align,
  );

  entry = OverlayEntry(builder: (ctx) {
    return Directionality(
        textDirection: direction,
        child: _GuiContainer(
          position: position,
          movingOnWindowChange: movingOnWindowChange,
          key: key,
          child: widget,
          animationBuilder: animationBuilder,
          animationDuration: animationDuration,
          animationCurve: animationCurve,
        ),
    );
  });

  dismissOtherToast ??= theme.dismissOtherOnShow ?? false;

  if (dismissOtherToast == true) {
    GuiManager().dismissAll();
  }

  future = GuiFuture._(entry, onDismiss, key, animationDuration);

  Overlay.of(context).insert(entry);
  GuiManager().addFuture(future);

  return future;
}
