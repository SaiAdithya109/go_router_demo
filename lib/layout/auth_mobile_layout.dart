import 'package:flutter/material.dart';

class AuthMobileLayout extends StatelessWidget {
  final Widget child;
  const AuthMobileLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}