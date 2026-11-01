import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/config/assets/app_vector.dart';
import 'package:spotify/core/config/routing/routes.dart';
import 'package:spotify/core/service/secure_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateFromSplash();
  }

  Future<void> _navigateFromSplash() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    final hasToken = await SecureStorageService.hasValidToken();

    if (!mounted) return;
    context.go(hasToken ? Routes.homeScreen : Routes.getStartScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(AppVector.spotifyLogo)),
    );
  }
}
