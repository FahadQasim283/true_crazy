import 'package:flutter/material.dart';
import 'package:truly_crazy/core/constants/app_icons.dart';
import '/core/constants/app_strings.dart';
import '/core/constants/app_colors.dart';
import 'package:truly_crazy/core/theme/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appName = AppStrings.appName;
    final words = appName.split(' ');
    final first = words.isNotEmpty ? words[0] : appName;
    final second = words.length > 1 ? words.sublist(1).join(' ') : '';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            // Center: Icon + App Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage(AppIcons.appicon)),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: first,
                        style: AppTextStyles.heading(context).copyWith(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryLight,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      if (second.isNotEmpty) ...[
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: second,
                          style: AppTextStyles.heading(context).copyWith(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Bottom text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Start Your Love Story ',
                    style: AppTextStyles.title(context).copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(' ❤️ ', style: AppTextStyles.heading(context).copyWith(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
