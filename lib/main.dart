import 'package:countapp_using_container_presentation/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:countapp_using_container_presentation/middlewares/regist_counter.dart';
import 'package:countapp_using_container_presentation/reducers/app_state_reducer.dart';
import 'package:countapp_using_container_presentation/util/const.dart';
import 'package:countapp_using_container_presentation/containers/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  final store = Store(
    appReducer,
    initialState: AppState(),
    middleware: createMiddlewares(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'sample app',
        routes: {
          AppRoutes.home: (context) {
            return Home();
          },
        },
      ),
    );
  }
}
