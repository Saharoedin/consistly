import 'package:consistly/app/core/services/auth_service.dart';
import 'package:consistly/app/core/theme/app_theme.dart';
import 'package:consistly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authService = AuthService();
  await authService.ensureAnonymousAuth();
  final isOnboarded = SpUtil.getBool('isOnboarded') ?? false;
  runApp(
    ConsistlyApp(isOnboarded: isOnboarded),
  );
}

class ConsistlyApp extends StatelessWidget {
  const ConsistlyApp({
    super.key,
    required this.isOnboarded,
  });

  final bool isOnboarded;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Consistly",
      initialRoute: isOnboarded ? AppPages.HOME : AppPages.ONBOARDING,
      getPages: AppPages.routes,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      themeMode: ThemeMode.system,
      builder: EasyLoading.init(),
    );
  }
}
