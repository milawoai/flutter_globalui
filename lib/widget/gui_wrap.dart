part of '../core/gui_core.dart';

class GuiWrapper extends StatefulWidget {
    /// Usually should be [MaterialApp] or [CupertinoApp].
    final Widget child;

    final ToastTheme toastTheme;

    final ModalTheme modalTheme;

  const GuiWrapper({
    Key key, 
    this.toastTheme, 
    this.modalTheme,
     this.child
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuiWrapperState();
}

class _GuiWrapperState extends State<GuiWrapper> {

  ToastTheme get toastTheme => widget.toastTheme;
  ModalTheme get modalTheme => widget.modalTheme;
  
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
    
    ToastTheme uToastTheme = toastTheme;
    if (uToastTheme == null) {
      uToastTheme = ToastTheme();
    }
    ModalTheme uModalTheme = modalTheme;
    if (uModalTheme == null) {
      uModalTheme = ModalTheme();
    }

    Widget w = Directionality(
      child: overlay,
      textDirection: TextDirection.ltr,
    );

    // var typography = Typography(platform: Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android);
    // final TextTheme defaultTextTheme = typography.white;
    // TextStyle textStyle = widget.textStyle ??
    //     defaultTextTheme.body1.copyWith(
    //       fontSize: 15.0,
    //       fontWeight: FontWeight.normal,
    //       color: Colors.white,
    //     );

    return _GuiTheme(
      child: w,
      toastTheme: uToastTheme,
      modalTheme: uModalTheme
    );
  }

}