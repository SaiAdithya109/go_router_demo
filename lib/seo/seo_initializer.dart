import 'package:flutter/material.dart';
import 'package:go_router_demo/seo/seo_service_mobile.dart' if (dart.library.html) 'package:go_router_demo/seo/seo_service.dart';

/// Widget that initializes SEO service for web builds
class SeoInitializer extends StatefulWidget {
  final Widget child;

  const SeoInitializer({
    super.key,
    required this.child,
  });

  @override
  State<SeoInitializer> createState() => _SeoInitializerState();
}

class _SeoInitializerState extends State<SeoInitializer> {
  @override
  void initState() {
    super.initState();
    // Initialize SEO service (web only)
    SeoService.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    SeoService.instance.dispose();
    super.dispose();
  }
}
