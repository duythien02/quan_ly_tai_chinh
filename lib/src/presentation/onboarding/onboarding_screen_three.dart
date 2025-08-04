// lib/src/presentation/pages/onboarding/onboarding_screen_three.dart

import 'package:ez_resources/ez_resources.dart';
import 'package:flutter/material.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EZResources.image(
                ImageParams(
                  name: AppImages.onboarding_3Image,
                  size: const ImageSize.square(200),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'An toàn và bảo mật',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                // ignore: lines_longer_than_80_chars
                'Dữ liệu của bạn được bảo vệ an toàn. Bắt đầu hành trình quản lý tài chính thông minh ngay hôm nay!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
