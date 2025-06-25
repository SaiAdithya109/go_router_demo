// Mobile-only SEO service - all methods are no-ops
import 'package:go_router/go_router.dart';

class SeoService {
  static SeoService? _instance;
  static SeoService get instance => _instance ??= SeoService._();
  
  SeoService._();

  /// Initialize - no-op on mobile
  Future<void> initialize() async {
    // No SEO functionality needed on mobile
  }

  /// Update for route - no-op on mobile  
  void updateForRoute(GoRouterState state) {
    // No SEO functionality needed on mobile
  }

  /// Dispose - no-op on mobile
  void dispose() {
    // No SEO functionality needed on mobile
  }
}
