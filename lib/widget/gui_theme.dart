part of '../core/gui_core.dart';

class _GuiTheme extends InheritedWidget {
  final ToastTheme toastTheme;

  final ModalTheme modalTheme;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  const _GuiTheme({
    this.toastTheme,
    this.modalTheme,
    Widget child
  })  : super(child: child);

  static _GuiTheme of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<_GuiTheme>();
}
