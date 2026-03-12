import 'package:finance_ui/core/routing/app_routes.dart';
import 'package:finance_ui/features/auth/register_screen.dart';
import 'package:finance_ui/features/main_screen/main_screen.dart';
import 'package:finance_ui/features/password_recovery/create_new_password.dart';
import 'package:finance_ui/features/password_recovery/forgot_password_screen.dart';
import 'package:finance_ui/features/auth/login_screen.dart';
import 'package:finance_ui/features/onboarding/on_boarding_screen.dart';
import 'package:finance_ui/features/password_recovery/password_changed_screen.dart';
import 'package:finance_ui/features/verify_otp/verify_otp_screen.dart';

import 'package:go_router/go_router.dart';

class RouterGenretionConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onboardingscreen,
    routes: [
      GoRoute(
        name: AppRoutes.onboardingscreen,
        path: AppRoutes.onboardingscreen,
        builder: (context, state) => const OnBordingScreen(),
      ),
      GoRoute(
        name: AppRoutes.loginscreen,
        path: AppRoutes.loginscreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppRoutes.registerscreen,
        path: AppRoutes.registerscreen,
        builder: (context, state) => const RegestarScreen(),
      ),
      GoRoute(
        name: AppRoutes.forgetpassword,
        path: AppRoutes.forgetpassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        name: AppRoutes.verifyCodeScreen,
        path: AppRoutes.verifyCodeScreen,
        builder: (context, state) => const VerifyOtpScreen(),
      ),
      GoRoute(
        name: AppRoutes.passChangedScreen,
        path: AppRoutes.passChangedScreen,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        name: AppRoutes.ceatenewpasswordScreen,
        path: AppRoutes.ceatenewpasswordScreen,
        builder: (context, state) => const CreateNewPasswordScreen(),
      ),
      GoRoute(
        name: AppRoutes.mainScreen,
        path: AppRoutes.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
    ],
  );
}
