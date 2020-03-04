import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/CounterNotifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Privoder Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProvidePage(title: 'Provider Selector Home Page'),
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
  CounterNotifier _counter = CounterNotifier();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ChangeNotifierProvider.value(
          value: _counter,
          child: Column(
            children: <Widget>[
              Selector<CounterNotifier, int>(
                selector: (_, notifier) => notifier.count,
                builder: (context, value, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Increment1 build ${_counter.count1}  count => You have pushed the button this many times:',
                      ),
                      Text(
                        '${_counter.count}',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      FlatButton(
                          onPressed: () {
                            _counter.increment();
                          },
                          child: Text('Increment'))
                    ],
                  );
                },
              ),
              Selector<CounterNotifier, int>(
                selector: (_, notifier) => notifier.count1,
                builder: (context, value, child) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Increment build ${_counter.count}  count => You have pushed the button this many times:',
                        ),
                        Text(
                          '${_counter.count1}',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        FlatButton(
                            onPressed: () {
                              _counter.increment1();
                            },
                            child: Text('Increment1'))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
