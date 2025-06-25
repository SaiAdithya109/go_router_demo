// This file only exists for web compilation
// Mobile builds will not include this file

class SeoMetadata {
  final String title;
  final String description;

  const SeoMetadata({
    required this.title,
    required this.description,
  });
}

class SeoMetadataConfig {
  // Default/Fallback metadata
  static const SeoMetadata _defaultMetadata = SeoMetadata(
    title: 'Go Router Demo | Modern Flutter Navigation App',
    description: 'A comprehensive Flutter app showcasing modern navigation patterns with go_router, featuring responsive design for web and mobile platforms.',
  );

  // Route-specific metadata
  static const Map<String, SeoMetadata> _routeMetadata = {
    'Home': SeoMetadata(
      title: 'Home - Go Router Demo | Welcome to Flutter Navigation',
      description: 'Explore the main dashboard of Go Router Demo. Discover features, navigate through different sections, and experience smooth Flutter routing.',
    ),
    'Login': SeoMetadata(
      title: 'Login - Go Router Demo | Secure Access Portal',
      description: 'Access your Go Router Demo account securely. Login to explore all features and experience the power of Flutter navigation.',
    ),
    'Register': SeoMetadata(
      title: 'Sign Up - Go Router Demo | Join Our Platform',
      description: 'Create your Go Router Demo account today. Register to unlock full access to our Flutter navigation showcase and features.',
    ),
    'Intro Screen': SeoMetadata(
      title: 'Welcome - Go Router Demo | Get Started Guide',
      description: 'Welcome to Go Router Demo! Learn about our Flutter app features and start your journey with modern navigation patterns.',
    ),
    'Register Options': SeoMetadata(
      title: 'Registration Options - Go Router Demo | Choose Your Path',
      description: 'Select your preferred registration method for Go Router Demo. Multiple options available to get you started quickly.',
    ),
    'Forgot Password': SeoMetadata(
      title: 'Reset Password - Go Router Demo | Account Recovery',
      description: 'Reset your Go Router Demo password securely. Quick and easy account recovery process to get you back on track.',
    ),
    'Activity': SeoMetadata(
      title: 'Activity Feed - Go Router Demo | Stay Updated',
      description: 'View your latest activities and updates in Go Router Demo. Track your progress and stay informed about recent changes.',
    ),
    'Profile': SeoMetadata(
      title: 'Profile - Go Router Demo | Manage Your Account',
      description: 'Manage your Go Router Demo profile settings. Update your information and customize your app experience.',
    ),
    'Social': SeoMetadata(
      title: 'Social Hub - Go Router Demo | Connect & Share',
      description: 'Connect with others in the Go Router Demo community. Share experiences and discover new navigation patterns.',
    ),
  };

  /// Get metadata for a specific route name
  static SeoMetadata getMetadata(String routeName) {
    return _routeMetadata[routeName] ?? _defaultMetadata;
  }


  /// Get all available route names (for reference)
  static List<String> get availableRoutes => _routeMetadata.keys.toList();

  /// Get default metadata
  static SeoMetadata get defaultMetadata => _defaultMetadata;
}
