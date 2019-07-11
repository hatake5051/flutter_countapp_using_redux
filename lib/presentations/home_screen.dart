import 'package:flutter/material.dart';
import 'package:countapp_using_container_presentation/util/keys.dart';
import 'package:countapp_using_container_presentation/containers/load_counter.dart';

class HomeScreen extends StatelessWidget {
  final void Function() onAddTapped, onRemoveTapped;

  HomeScreen({
    Key key,
    @required this.onAddTapped,
    @required this.onRemoveTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Flutter'),
      ),
      body: LoadCounter(),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            key: Keys.homeRemoveButton,
            onPressed: onRemoveTapped,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            key: Keys.homeAddButton,
            onPressed: onAddTapped,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
