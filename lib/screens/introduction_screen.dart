import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (MediaQuery.of(context).size.width < 600) {
        return Padding(
          padding: EdgeInsets.all(48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.rocket_launch,
                size: 80,
                color: Colors.black,
              ),
              SizedBox(height: 32),
              Text(
                'Welcome to this Demo yapp',
              ),
              SizedBox(height: 16),
              Text(
                'Discover amazing features',
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('Register Options');
                },
                child: Text('Get Started'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  context.pushNamed('Login');
                },
                child: Text('Already have an account? Login'),
              ),
            ],
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.all(48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.rocket_launch,
                size: 80,
                color: Colors.black,
              ),
              SizedBox(height: 32),
              Text(
                'Welcome to this Demo yapp',
              ),
              SizedBox(height: 16),
              Text(
                'Discover amazing features',
              ),
            ],
          ),
        );
      }
    });
  }
}
