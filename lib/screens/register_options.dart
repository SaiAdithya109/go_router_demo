import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterOptions extends StatelessWidget {
  const RegisterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Options'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pushNamed('Register');
              },
              child: const Text('Register with Email'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.g_mobiledata),
              label: const Text('Continue with Google'),
              onPressed: () {
                context.pushNamed('Register');
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.apple),
              label: const Text('Continue with Apple'),
              onPressed: () {
                context.pushNamed('Register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
