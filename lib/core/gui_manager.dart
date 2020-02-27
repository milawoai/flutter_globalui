
// part of 'gui_core.dart';
part of 'gui_core.dart';

class GuiManager {
  GuiManager._();

  static GuiManager _instance;

   factory GuiManager() {
    _instance ??= GuiManager._();
    return _instance;
  }

  Set<GuiFuture> guiSet = Set();

  void dismissAll({bool showAnim = false}) {
    guiSet.toList().forEach((v) {
      v.dismiss(showAnim: showAnim);
    });
  }

  void removeFuture(GuiFuture future) {
    guiSet.remove(future);
  }

  void addFuture(GuiFuture future) {
    guiSet.add(future);
  }
}