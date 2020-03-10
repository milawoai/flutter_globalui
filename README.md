# globalui

A pure Flutter UI Manager Library. 

Show UI without context

## Usage

### 1. Add library to your pubspec.yaml

```yaml
dependencies:
  globalui: ^2.3.1 # such as version, you need use the latest version of pub.
```

### 2. Import library in root file

```dart
import 'package:globalui/globalui.dart';

void main() => runApp(MyApp());
```

### 3. Use Wrapper to Wrap

```dart
class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return GuiWrapper(
        child: MaterialApp(
          ...
        )
    );
  }

}
```

if user want to use custom style to override default, Lib offer some themes;


```dart
class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return GuiWrapper(
         toastTheme: ToastTheme(
              textStyle: TextStyle(color: Colors.red, fontSize: 20.0)
      ),
      modalTheme: ModalTheme(
              .....
      ),
        child: MaterialApp(
          ...
        )
    );
  }

}
```


### 4. Show UI Without context

Currently, We offer two kind of UI:


**toast like**

will hide themselves in seconds

```dart
showToast("tast");
```

```dart

Widget widget = Container(.....)

showToastWidget(widget);
```

**modal like**

will hide themselves by user action

```dart
showCancelConfirmModal(
                    title: "testTitle",
                    msg: "测试消息",
                    cancelText: "BYE",
                    onCancelPressed: () {
                      print("click cancel");
                    },
                    confirmText: "Hi",
                    confirmTextStyle: TextStyle(color: Colors.white, fontSize: 15.0),
                    confirmBackgroundColor: Colors.red,
                    onConfirmPressed: () {
                      print("click confirm");
                    },
                  );
```

```dart
showCancelModal(
                    title: "测试标题",
                    msg: "测试消息",
                    onCancelPressed: () {
                      print("showCancelModal");
                    });
```

```dart

Widget widget = Container(.....)

showModalWidget(widget);
```