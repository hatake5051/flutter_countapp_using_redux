import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:countapp_using_container_presentation/models/app_state.dart';
import 'package:countapp_using_container_presentation/util/keys.dart';
import 'package:countapp_using_container_presentation/presentations/home_screen.dart';

void main() {
  testWidgets('Home presentation', (WidgetTester t) async {
    var tmp = 0;
    await t.pumpWidget(StoreProvider(
      store: Store<AppState>((AppState state, action) => state,
          initialState: AppState()),
      child: MaterialApp(
        home: HomeScreen(onRemoveTapped: () {
          tmp--;
        }, onAddTapped: () {
          tmp++;
        }),
      ),
    ));

    await t.tap(find.byKey(Keys.homeAddButton));
    expect(tmp, 1);

    await t.tap(find.byKey(Keys.homeRemoveButton));
    expect(tmp, 0);
  });
}
