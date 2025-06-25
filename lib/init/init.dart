import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/routes/router.dart';
import 'package:go_router_demo/seo/seo_initializer.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({super.key});

  @override
  State<InitWidget> createState() => IinitWidgetState();
}

class IinitWidgetState extends State<InitWidget> {
  late final GoRouter _router;
  @override
  void initState() {
    super.initState();
    _router = AppRouter().router;
  }

  @override
  Widget build(BuildContext context) {
    return SeoInitializer(
      child: MaterialApp.router(
        title: 'Go Router Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}