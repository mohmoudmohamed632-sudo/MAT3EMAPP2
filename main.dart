import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'shared/services/firebase_service.dart';
import 'shared/themes/app_theme.dart';

// Import all app splash screens
import 'customer/screens/splash_screen.dart';
import 'delivery/screens/splash_screen.dart';
import 'admin/screens/splash_screen.dart';

// App Flavor - Change this to switch between apps
// customer, delivery, admin
const String appFlavor = String.fromEnvironment('FLAVOR', defaultValue: 'customer');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await FirebaseService.initialize();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _getAppName(),
      debugShowCheckedModeBanner: false,
      theme: _getTheme(),
      home: _getHomeScreen(),
    );
  }

  String _getAppName() {
    switch (appFlavor) {
      case 'customer':
        return 'Foodie';
      case 'delivery':
        return 'FastDelivery';
      case 'admin':
        return 'RestaurantManager';
      default:
        return 'Restaurant System';
    }
  }

  ThemeData _getTheme() {
    switch (appFlavor) {
      case 'customer':
        return AppTheme.getCustomerTheme();
      case 'delivery':
        return AppTheme.getDeliveryTheme();
      case 'admin':
        return AppTheme.getAdminTheme();
      default:
        return AppTheme.getCustomerTheme();
    }
  }

  Widget _getHomeScreen() {
    switch (appFlavor) {
      case 'customer':
        return const CustomerSplashScreen();
      case 'delivery':
        return const DeliverySplashScreen();
      case 'admin':
        return const AdminSplashScreen();
      default:
        return const CustomerSplashScreen();
    }
  }
}
