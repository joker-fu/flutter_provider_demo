import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/CounterNotifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CounterNotifier(),
      child: MaterialApp(
        title: 'Privoder Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProvidePage(title: 'Provider Demo Home Page'),
      ),
    );
  }
}

class ProvidePage extends StatefulWidget {
  final String title;

  ProvidePage({Key key, this.title}) : super(key: key);

  @override
  State<ProvidePage> createState() => _ProvidePageState();
}

class _ProvidePageState extends State<ProvidePage> {
  CounterNotifier _counter;

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    final counter = Provider.of<CounterNotifier>(context);
    if (this._counter != counter) {
      _counter = counter;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter.count}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
