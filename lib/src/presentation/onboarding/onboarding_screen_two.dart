import 'package:ez_resources/ez_resources.dart';
import 'package:flutter/material.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

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
                  name: AppImages.onboarding_2Image,
                  size: const ImageSize.square(200),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Báo cáo trực quan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                // ignore: lines_longer_than_80_chars
                'Các biểu đồ và báo cáo chi tiết giúp bạn hiểu rõ thói quen chi tiêu và đưa ra quyết định tốt hơn.',
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
