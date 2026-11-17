import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_theme.dart';
import 'core/network/api_client.dart';
import 'repositories/auth_repository.dart';
import 'repositories/booking_repository.dart';
import 'repositories/gig_repository.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/booking_viewmodel.dart';
import 'viewmodels/gig_discovery_viewmodel.dart';
import 'views/auth/login_screen.dart';

void main() {
  final client = ApiClient();
  runApp(MultiProvider(providers: [
    Provider.value(value: client),
    ChangeNotifierProvider(create: (_) => AuthViewModel(AuthRepository(client))),
    ChangeNotifierProvider(create: (_) => GigDiscoveryViewModel(GigRepository(client))),
    ChangeNotifierProvider(create: (_) => BookingViewModel(BookingRepository(client))),
  ], child: const SkillLinkApp()));
}

class SkillLinkApp extends StatelessWidget {
  const SkillLinkApp({super.key});
  @override Widget build(BuildContext context) => MaterialApp(title: 'SkillLink', debugShowCheckedModeBanner: false, theme: AppTheme.light, home: const LoginScreen());
}
