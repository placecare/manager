import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manager/presentation/accounts/users/ui/components/users_layout.dart';
import 'package:manager/presentation/accounts/users/ui/screens/user_overview.dart';
import 'package:manager/routes.dart';

final _userShellNavigatorKey = GlobalKey<NavigatorState>();

ShellRoute userShellRoute = ShellRoute(
    navigatorKey: _userShellNavigatorKey,
    builder: (context, state, child) => UsersLayout(child: child),
    routes: [
      GoRoute(
          path: RouteMapper.usersOverview.path,
          builder: (context, state) => const UserOverview()),
    ]);
