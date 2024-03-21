
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/provider/counter_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<CounterProvider>(
        create: (context) => CounterProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 10), (_) => Provider.of<CounterProvider>(context).increment());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Counter'),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, counterProvider, child) { // Access counterProvider
            return Text(
              'You clicked ${counterProvider.counter} times.',
              style: TextStyle(fontSize: 48),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
//We wrap the entire app widget tree with ChangeNotifierProvider<CounterProvider>.
//The MyHomePage uses Consumer to access the CounterProvider instance.
/*Inside Consumer's builder:
We access the current counter value using counterProvider.counter.
Only this Text widget rebuilds whenever the counter value changes, thanks to Provider's efficient state management.
The timer in initState increments the counter using Provider.of<CounterProvider>(context).increment().
Benefits:

Only the Text widget wrapped in the Consumer rebuilds, maintaining a more efficient UI update.
The logic to increment the counter is separated from the UI logic, promoting better organization.
This approach demonstrates how Provider can help optimize rebuilds and create a smoother animation experience.*/