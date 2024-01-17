import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Example usage of push method
            context.push(widget: MySecondPage());
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Example usage of pop method
            context.pop('Data from Second Page');
          },
          child: Text('Go Back to First Page'),
        ),
      ),
    );
  }
}

extension BuildContextX on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isMobile => width < 768;
  bool get isTablet => width >= 768;
  bool get isDesktop => width >= 1024;

  T responsive<T>({
    required T sm,
    T? md,
    T? lg,
  }) {
    if (isDesktop) {
      return lg ?? md ?? sm;
    } else if (isTablet) {
      return md ?? sm;
    } else {
      return sm;
    }
  }

  Future<T?> push<T>({Route<T>? route, Widget? widget}) {
    assert(route == null || widget == null,
        'Only one of route or widget should be provided.');

    return Navigator.of(this)
        .push<T>(route ?? MaterialPageRoute(builder: (_) => widget!));
  }

  void pop<T>([T? result]) => Navigator.of(this).pop<T>(result);
}
