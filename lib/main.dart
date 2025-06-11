import 'package:flutter/material.dart';
import 'package:go_router_demo/init/init.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy(); 
  runApp(const InitWidget());
}
