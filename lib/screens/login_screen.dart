import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
          ),
          SizedBox(height: 32),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.goNamed('Home');
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () => context.goNamed('Register Options'),
            child: Text(
              'Need an account? Register',
            ),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () => context.goNamed('Forgot Password'),
            child: Text(
              'Forgot Password?',
            ),
          ),
        ],
      ),
    );
  }
}
