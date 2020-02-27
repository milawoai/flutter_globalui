// part of 'gui_core.dart';
// import 'gui_core.dart';
part of 'gui_core.dart';

class GuiFuture {
  final OverlayEntry _entry;
  final VoidCallback _onDismiss;
  bool _isShow = true;
  final GlobalKey<__GuiToastContainerState> _containerKey;
  final Duration animationDuration;

   GuiFuture._(
    this._entry,
    this._onDismiss,
    this._containerKey,
    this.animationDuration,
  );

  void dismiss({bool showAnim = false}) {
    if (!_isShow) {
      return;
    }
    _isShow = false;
    _onDismiss?.call();
    GuiManager().removeFuture(this);

    if (showAnim) {
      _containerKey.currentState.showDismissAnim();
      Future.delayed(animationDuration, () {
        _entry.remove();
      });
    } else {
      _entry.remove();
    }
  }

}