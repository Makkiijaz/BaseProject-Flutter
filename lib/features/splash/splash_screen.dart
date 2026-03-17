import 'package:auto_route/auto_route.dart';
import 'package:base_project/core/bloc/cubit/app_version_cubit.dart';
import 'package:base_project/core/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/text_styles.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appVersionCubit = Di.sl<AppVersionCheckerCubit>();

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
    _navigateToLogin();
  }

  Future<void> _loadAppVersion() async {
    await appVersionCubit.appInfoChecker();
  }

  Future<void> _navigateToLogin() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorPalette.primary, ColorPalette.secondry],
          ),
        ),
        child: Center(
          child: BlocBuilder(
            bloc: appVersionCubit,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (appVersionCubit.currentAppVersion.isNotEmpty) ...[
                    CustomSizedBox(height: 16),
                    AppText(
                      text: appVersionCubit.currentAppVersion,
                      style: AppTextStyles.bodyRegular(context).copyWith(
                        color: ColorPalette.white.withValues(alpha: 0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
