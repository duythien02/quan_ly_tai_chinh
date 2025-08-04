// lib/src/presentation/pages/onboarding/onboarding_screen_one.dart

import 'package:ez_intl/ez_intl.dart';
import 'package:ez_resources/ez_resources.dart';
import 'package:flutter/material.dart';

class OnboardingScreenOne extends StatelessWidget {
  // Không cần callback `onNext` nữa
  const OnboardingScreenOne({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EZResources.image(
                ImageParams(
                  name: AppImages.onboarding_1Image,
                  size: const ImageSize.square(200),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                context.l10n.onboarding_1Title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.onboarding_1Description,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
