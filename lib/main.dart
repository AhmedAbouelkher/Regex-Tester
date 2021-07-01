import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  setWindowTitle("Regex Tester");

  const size = const Size(500, 250);
  setWindowMinSize(size);
  setWindowMaxSize(Size.infinite);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Regex Tester",
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController _regexFieldController;
  late TextEditingController _textFieldController;

  late bool _hasFoundMatch;
  bool _checked = false;

  @override
  void initState() {
    _regexFieldController = TextEditingController();
    _textFieldController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _regexFieldController.dispose();
    _textFieldController.dispose();
    super.dispose();
  }

  bool _check() {
    final _regex = RegExp(_regexFieldController.text.trim());
    return _regex.hasMatch(_textFieldController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Pattern")),
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _regexFieldController,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _regexFieldController.clear();
                  },
                  child: Text("Clear"),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Text")),
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _textFieldController,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _textFieldController.clear();
                  },
                  child: Text("Clear"),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_textFieldController.text.trim().isEmpty || _regexFieldController.text.trim().isEmpty) {
                  setState(() {
                    _checked = false;
                  });
                  return;
                }
                _hasFoundMatch = _check();
                _checked = true;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text("Check"),
              ),
            ),
            if (_checked) ...[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 100),
                  child: _hasFoundMatch
                      ? Icon(
                          Icons.check,
                          key: ValueKey(-1),
                          color: Colors.green,
                          size: 50,
                        )
                      : Icon(
                          Icons.close,
                          key: ValueKey(2),
                          color: Colors.red,
                          size: 50,
                        ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
