import 'package:go_router/go_router.dart';
import 'package:manager/presentation/accounts/users/router.dart';
import 'package:manager/presentation/authentication/screens/login_screen.dart';
import 'package:manager/presentation/common/ui/application_layout.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) {
    // if (!state.matchedLocation.contains('/authentication')) {
    //   return '/authentication/login';
    // }

    return null;
  },
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ApplicationLayout(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return Scaffold(
                child: Container(
                  color: Colors.slate.shade100,
                  child: Center(
                    child: Column(
                      children: [
                        OutlineButton(
                            onPressed: () {
                              context.go('/authentication/login');
                            },
                            child: Text('ff')),
                        Text('Home'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          userShellRoute,

          GoRoute(
            path: '/authentication/login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
        ])
  ],
);
