import 'package:shadcn_flutter/shadcn_flutter.dart';

final class UsersLayout extends StatelessWidget {
  final Widget child;

  const UsersLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(child: child);
  }
}
