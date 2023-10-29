import 'package:flutter/material.dart';
import 'package:photo_editor/screens/completed_screen.dart';
import 'package:photo_editor/screens/recycle_bin.dart';
import 'package:photo_editor/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      case CompletedScreen.id:
        return MaterialPageRoute(builder: (_) => const CompletedScreen());
      default:
        return null;
    }
  }
}
