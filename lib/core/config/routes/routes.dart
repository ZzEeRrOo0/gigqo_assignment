import 'package:flutter/widgets.dart';
import 'package:gigqo_assignment/modules/main/screens/counter.dart';
import 'package:gigqo_assignment/modules/main/screens/edit_track.dart';
import 'package:gigqo_assignment/modules/main/screens/home.dart';
import 'package:gigqo_assignment/modules/main/screens/new_track.dart';

const String HOME_SCREEN_ROUTE = '/';
const String NEW_TRACK_SCREEN_ROUTE = '/new';
const String EDIT_TRACK_SCREEN_ROUTE = '/edit';
const String COUNTER_SCREEN_ROUTE = '/counter';

final Map<String, WidgetBuilder> routes = {
  HOME_SCREEN_ROUTE: (context) => HomeScreen(),
  NEW_TRACK_SCREEN_ROUTE: (context) => NewTrackScreen(),
  EDIT_TRACK_SCREEN_ROUTE: (context) => EditTrackScreen(),
  COUNTER_SCREEN_ROUTE: (context) => CounterScreen(),
};