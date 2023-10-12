import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
class MainScaffold extends StatelessWidget {
  const MainScaffold({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ThemedAppBar(
        title: const Text('Theme provider example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.colorize),
            onPressed: () => _showColorPicker(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Text(
                'Text',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: themeProvider.mainColor,
                ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Text("A paragraph is defined as “a group of sentences or a single sentence that forms a unit” ( Unfordable and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: themeProvider.mainColor,
                ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: themeProvider.mainColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Slider(
                activeColor: themeProvider.mainColor,
                inactiveColor: themeProvider.mainColor.withOpacity(0.5),
                value: themeProvider.progress,
                onChanged: (newValue) {
                  themeProvider.progress = newValue;
                },
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Switch(
                activeColor: themeProvider.mainColor,
                value: true,
                onChanged: (newValue) {},
              ),
            ),
            Semantics(
              button: true,
              enabled: true,
              label: 'Clickable text here!',
              child: GestureDetector(
                  onTap: () {
                    debugPrint('Clicked!');
                  }, child: const Text('Click Me!', style: TextStyle(fontSize: 56))
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showColorPicker(BuildContext context) {
    ThemeProvider themeProvider =
    Provider.of<ThemeProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: Wrap(
          children: [
            ColorPicker(
              pickerColor: themeProvider.mainColor,
              onColorChanged: (color) => themeProvider.changeThemeColor(color),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
class _ThemedAppBar extends StatelessWidget implements  PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  @override
  final Size preferredSize;
  const _ThemedAppBar({
    Key? key,
    this.title,
    this.actions,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => AppBar(
        title: title,
        actions: actions,
        backgroundColor: themeProvider.mainColor,
      ),
    );
  }
}