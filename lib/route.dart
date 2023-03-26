import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/home/screens/home_page.dart';

final loggedOutRouter = RouteMap(routes: {
  '/': (_) => const MaterialPage(
        child: LoginScreen(),
      ),
});
final loggedInRouter = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: HomePage(),
        ),
  },
);
