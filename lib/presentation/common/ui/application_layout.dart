import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:manager/routes.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

final class ApplicationLayout extends StatelessWidget {
  final Widget child;

  const ApplicationLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).matchedLocation;

    if (currentLocation == '/authentication/login') {
      return child;
    }

    return Scaffold(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: double.infinity,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 64,
                width: double.infinity,
                color: Colors.blue.shade200,
              ),
              const Expanded(child: NavigationLinks()),
              Padding(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: PrimaryButton(
                    onPressed: () {},
                    leading: const Icon(RadixIcons.exit),
                    child: const Text('Déconnexion'),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(child: child)
      ],
    ));
  }
}

final class NavigationLinks extends HookWidget {
  const NavigationLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).matchedLocation;

    final matchedRoute = routerLinks.firstWhere(
        (element) => currentLocation.contains(element.path),
        orElse: () => routerLinks.first);

    final currentRoute = useState(routerLinks.indexOf(matchedRoute));

    return NavigationSidebar(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
        ),
        index: currentRoute.value,
        onSelected: (index) {
          currentRoute.value = index;
          context.go(routerLinks[index].path);
        },
        children: [
          const NavigationGap(24),
          ...defaultLinks.map((link) => buildButton(link.label, link.icon)),
          const NavigationGap(24),
          const NavigationDivider(),
          const NavigationLabel(child: Text('Utilisateurs')),
          ...accountLinks.map((link) => buildButton(link.label, link.icon)),
          const NavigationGap(24),
          const NavigationDivider(),
          const NavigationLabel(child: Text('Plateforme')),
          ...platformLinks.map((link) => buildButton(link.label, link.icon)),
        ]);
  }
}

NavigationBarItem buildButton(String label, IconData icon) {
  return NavigationButton(
    label: Text(label),
    child: Icon(icon),
  );
}
