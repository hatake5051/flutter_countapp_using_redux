import 'package:flutter/material.dart';

class CountScreen extends StatelessWidget {
  final int counter;
  final Exception counterException;
  final void Function() onReloadTapped;

  CountScreen({
    Key key,
    @required this.counter,
    @required this.counterException,
    @required this.onReloadTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text((counterException != null)
              ? '$counterException'
              : 'You have pushed the button this many times: '),
          (counterException != null)
              ? FlatButton(
                  onPressed: onReloadTapped,
                  child: Text('Reload'),
                )
              : Text(
                  '$counter',
                  style: Theme.of(context).textTheme.display1,
                ),
        ],
      ),
    );
  }
}
