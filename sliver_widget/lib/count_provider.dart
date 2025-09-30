import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    if (value > 0) {
      _value--;
      notifyListeners();
    }
  }

  void reset() {
    _value = 0;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MaterialApp(title: 'Provider Example', home: const CounterPage()),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<Counter>().value;
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Example')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text('$count', style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 16),
              Text('Tekan Tombol untuk ubah nilai counter', style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () => context.read<Counter>().increment(),
                    child: Text('Increment'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<Counter>().decrement(),
                    child: Text('Decrement'),
                  ),
                  FilledButton.tonal(
                    onPressed: () => context.read<Counter>().reset(),
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
