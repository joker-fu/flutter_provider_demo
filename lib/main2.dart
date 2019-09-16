import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/CounterNotifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Provider.value(
//      value: 36,
//      child: ChangeNotifierProvider.value(
//        value: CounterNotifier(),
//        child: MaterialApp(
//          title: 'Privoder Demo',
//          theme: ThemeData(
//            primarySwatch: Colors.blue,
//          ),
//          home: Page1(),
//        ),
//      ),
//    );
    return MultiProvider(
      providers: [
        Provider.value(value: 36),
        ChangeNotifierProvider.value(value: CounterNotifier())
      ],
      child: MaterialApp(
        title: 'Privoder Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Page1(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = Provider.of<int>(context).toDouble();
    final counter = Provider.of<CounterNotifier>(context);
    print('rebuild page 1');
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current count: ${counter.count}',
              style: TextStyle(
                fontSize: size,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page2()),
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild page 2');
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
        child: Consumer2<CounterNotifier, int>(
            builder: (context, counter, size, _) {
          print('rebuild page 2 refresh count');

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${counter.count}',
                style: TextStyle(
                  fontSize: size.toDouble(),
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 不需要监听改变（listen: false 不会重新调用build）
          Provider.of<CounterNotifier>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
