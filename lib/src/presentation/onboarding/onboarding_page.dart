// lib/src/presentation/pages/onboarding/onboarding_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/routes/app_router.dart';
import 'onboarding_screen_one.dart';
import 'onboarding_screen_three.dart';
import 'onboarding_screen_two.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onNextPage() async {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _navigateToLogin() async {
    await AutoRouter.of(context).push(AuthRoute());
  }

  Future<void> _navigateToRegister() async {
    await AutoRouter.of(context).push(AuthRoute(showLoginPageFirst: false));
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (final index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              OnboardingScreenOne(),
              OnboardingScreenTwo(),
              OnboardingScreenThree(),
            ],
          ),
          _buildSkipButton(),
          _buildBottomControls(),
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    if (_currentPage < 2) {
      return Positioned(
        top: 50,
        right: 24,
        child: TextButton(
          onPressed: _navigateToLogin,
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey.shade700,
          ),
          child: Text(context.l10n.skip),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildBottomControls() {
    return Positioned(
      bottom: 40,
      left: 24,
      right: 24,
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Theme.of(context).primaryColor,
              dotColor: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 40),
          if (_currentPage == 2) ...[
            ElevatedButton(
              onPressed: _navigateToRegister,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(context.l10n.register),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _navigateToLogin,
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              child: Text(context.l10n.login),
            ),
          ] else ...[
            ElevatedButton(
              onPressed: _onNextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(context.l10n.next),
            ),
          ],
        ],
      ),
    );
  }
}
