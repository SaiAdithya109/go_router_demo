// Web-only SEO service with full functionality
import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/seo/seo_metadata_web.dart';

class SeoService {
  static SeoService? _instance;
  static SeoService get instance => _instance ??= SeoService._();

  SeoService._();

  bool _isInitialized = false;

  /// Initialize the SEO service (web only)
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      _isInitialized = true;

      // Set initial default metadata
      _updateMetadata(SeoMetadataConfig.defaultMetadata);
    } catch (e) {
      if (kDebugMode) {
        print('SEO Service initialization failed: $e');
      }
    }
  }

  /// Update metadata for the current route
  void updateForRoute(GoRouterState state) {
    if (!_isInitialized) return;

    try {
      // Extract route name from the current route
      String? routeName = state.topRoute?.name;

      if (routeName == null) {
        // Fallback: try to determine route from path
        routeName = _getRouteNameFromPath(state.uri.path);
      }

      final metadata = SeoMetadataConfig.getMetadata(routeName);

      _updateMetadata(metadata);

      if (kDebugMode) {
        print('SEO updated for route: $routeName');
        print('Title: ${metadata.title}');
        print('Description: ${metadata.description}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to update SEO for route: $e');
      }
    }
  }

  /// Update the actual HTML meta tags
  void _updateMetadata(SeoMetadata metadata) {
    try {
      // Update page title
      html.document.title = metadata.title;

      // Update or create meta description tag
      _updateMetaTag('description', metadata.description);

      // Update or create meta keywords tag
      _updateMetaTag('keywords', _generateKeywords(metadata));
    } catch (e) {
      if (kDebugMode) {
        print('Failed to update meta tags: $e');
      }
    }
  }

  /// Helper method to update or create meta tags
  void _updateMetaTag(String name, String content) {
    try {
      var metaTag = html.document.querySelector('meta[name="$name"]');
      if (metaTag != null) {
        metaTag.setAttribute('content', content);
      } else {
        final newMeta = html.document.createElement('meta');
        newMeta.setAttribute('name', name);
        newMeta.setAttribute('content', content);
        html.document.head!.append(newMeta);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to update meta tag $name: $e');
      }
    }
  }

  /// Generate basic keywords from title and description
  String _generateKeywords(SeoMetadata metadata) {
    final keywords = <String>[
      'Go Router Demo',
      'Flutter',
      'Navigation',
      'App',
    ];

    // Extract relevant words from title
    final titleWords = metadata.title
        .toLowerCase()
        .split(RegExp(r'[^\w]+'))
        .where((word) => word.length > 3)
        .take(3);

    keywords.addAll(titleWords);

    return keywords.join(', ');
  }

  /// Fallback method to determine route name from path
  String _getRouteNameFromPath(String path) {
    switch (path) {
      case '/home':
        return 'Home';
      case '/intro':
        return 'Intro Screen';
      case '/login':
        return 'Login';
      case '/register':
        return 'Register';
      case '/register-options':
        return 'Register Options';
      case '/forgot-password':
        return 'Forgot Password';
      case '/activity':
        return 'Activity';
      case '/profile':
        return 'Profile';
      case '/social':
        return 'Social';
      default:
        return 'Home';
    }
  }

  /// Dispose resources
  void dispose() {
    _isInitialized = false;
  }
}
