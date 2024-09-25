import 'package:shadcn_flutter/shadcn_flutter.dart';

final class UserOverview extends StatelessWidget {
  const UserOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: Container(
        color: Colors.slate.shade100,
        child: Center(
          child: Column(
            children: [
              Text('Users'),
            ],
          ),
        ),
      ),
    );
  }
}