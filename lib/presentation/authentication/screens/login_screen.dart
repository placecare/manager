import 'package:shadcn_flutter/shadcn_flutter.dart';

final class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: Container(
        color: Colors.slate.shade100,
        child: Center(
          child: Text('Login screen'),
        ),
      ),
    );
  }
}
