import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
          leading: IconButton(
            onPressed: () {
              context.goNamed('Login');
            },
            icon: Icon(Icons.logout),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome to the Home Page',
            ),
          ],
        ),
      ),
      );
  }
}