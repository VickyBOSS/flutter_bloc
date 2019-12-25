import 'package:bloc_test/bloc/counter_bloc.dart';
import 'package:bloc_test/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_event.dart';
import 'models/counter.dart';

void main(args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is InitialCounterState)
              return InitialPage();
            else if (state is LoadingState)
              return LoadingPage();
            else if (state is CounterLoadedState)
              return ContentPage(
                counter: state.counter,
              );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () =>
            BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent()),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Click the Refresh button to get a random number !"),
    );
  }
}

class ContentPage extends StatelessWidget {
  final Counter counter;

  const ContentPage({Key key, @required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        counter.value.toString(),
        style: TextStyle(color: Colors.blue, fontSize: 24),
      ),
    );
  }
}
