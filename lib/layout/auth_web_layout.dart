import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/screens/introduction_screen.dart';

class AuthWebLayout extends StatelessWidget {
  final Widget child;
  const AuthWebLayout({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          flex: 1,
          child: IntroductionScreen(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ],
    ));
  }
}
