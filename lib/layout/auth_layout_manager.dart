import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router_demo/layout/auth_mobile_layout.dart';
import 'package:go_router_demo/layout/auth_web_layout.dart';

class AuthLayoutManager extends StatelessWidget {
  final Widget child;
  const AuthLayoutManager({ Key? key, required this.child}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width < 600) {
          return AuthMobileLayout(child: child);
        }
        return AuthWebLayout(child: child);
      },
    );
  }
}
